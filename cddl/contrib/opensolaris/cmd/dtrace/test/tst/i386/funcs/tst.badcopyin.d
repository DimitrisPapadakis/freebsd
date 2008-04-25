/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 */

#pragma ident	"%Z%%M%	%I%	%E% SMI"

/*
 * ASSERTION:
 *	On IA/32, there is a single 32-bit address space that is partitioned
 *	between user-level and kernel-level.  copyin()/copyinstr() and
 *	copyout()/copyoutstr() must check that addresses specified as
 *	user-level addresses are actually at user-level.  This test attempts
 *	to perform an illegal copyin() from a kernel address.  It asserts that
 *	the fault type is DTRACEFLT_BADADDR and that the bad address is set to
 *	the kernel address from which the copyin() was attempted.
 *
 * SECTION: Actions and Subroutines/copyin();
 * 	Actions and Subroutines/copyin();
 *	User Process Tracing/copyin() and copyinstr()
 */

BEGIN
{
	lbolt = copyin((uintptr_t)&`lbolt, sizeof (int));
	exit(1);
}

ERROR
{
	exit(arg4 == DTRACEFLT_BADADDR && arg5 == (uint64_t)&`lbolt ? 0 : 1);
}
