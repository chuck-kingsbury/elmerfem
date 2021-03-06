!/*****************************************************************************/
! *
! *  Elmer, A Finite Element Software for Multiphysical Problems
! *
! *  Copyright 1st April 1995 - , CSC - IT Center for Science Ltd., Finland
! *
! * This library is free software; you can redistribute it and/or
! * modify it under the terms of the GNU Lesser General Public
! * License as published by the Free Software Foundation; either
! * version 2.1 of the License, or (at your option) any later version.
! *
! * This library is distributed in the hope that it will be useful,
! * but WITHOUT ANY WARRANTY; without even the implied warranty of
! * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
! * Lesser General Public License for more details.
! *
! * You should have received a copy of the GNU Lesser General Public
! * License along with this library (in file ../LGPL-2.1); if not, write
! * to the Free Software Foundation, Inc., 51 Franklin Street,
! * Fifth Floor, Boston, MA  02110-1301  USA
! *
! *****************************************************************************/
!
!/******************************************************************************
! *
! *  Authors: Sami Ilvonen, Mikko Byckling
! *  Email:   sami.ilvonen@csc.fi
! *  Web:     http://www.csc.fi/elmer
! *  Address: CSC - IT Center for Science Ltd.
! *           Keilaranta 14
! *           02101 Espoo, Finland
! *
! *  Original Date: 26 Feb 2014
! *
! *****************************************************************************/

! Module that provides the interfaces for procedure pointers that used in 
! solvers


MODULE huti_interfaces
  IMPLICIT NONE

  INTERFACE
     SUBROUTINE mv_iface_s(x, r, ipar)
       REAL, DIMENSION(*) :: x, r
       INTEGER, DIMENSION(*) :: ipar
     END SUBROUTINE mv_iface_s

     SUBROUTINE pc_iface_s(p, b, ipar)
       REAL, DIMENSION(*) :: p, b
       INTEGER, DIMENSION(*) :: ipar
     END SUBROUTINE pc_iface_s

     FUNCTION dotp_iface_s(n, x, xinc, y, yinc) RESULT(res)
       INTEGER :: n, xinc, yinc
       REAL, DIMENSION(*) :: x, y
       REAL :: res
     END FUNCTION dotp_iface_s

     FUNCTION norm_iface_s(n, b, k) RESULT(res)
       INTEGER :: n, k
       REAL, DIMENSION(*) :: b
       REAL :: res
     END FUNCTION norm_iface_s
       
     FUNCTION stopc_iface_s(x, b, r, ipar, dpar) RESULT(res)
       REAL, DIMENSION(*) :: x, b, r
       INTEGER, DIMENSION(*) :: ipar
       DOUBLE PRECISION, DIMENSION(*) :: dpar
     END FUNCTION stopc_iface_s

     SUBROUTINE mv_iface_d(x, r, ipar)
       DOUBLE PRECISION, DIMENSION(*) :: x, r
       INTEGER, DIMENSION(*) :: ipar
     END SUBROUTINE mv_iface_d

     SUBROUTINE pc_iface_d(p, b, ipar)
       DOUBLE PRECISION, DIMENSION(*) :: p, b
       INTEGER, DIMENSION(*) :: ipar
     END SUBROUTINE pc_iface_d

     FUNCTION dotp_iface_d(n, x, xinc, y, yinc) RESULT(res)
       INTEGER :: n, xinc, yinc
       DOUBLE PRECISION, DIMENSION(*) :: x, y
       DOUBLE PRECISION :: res
     END FUNCTION dotp_iface_d

     FUNCTION norm_iface_d(n, b, k) RESULT(res)
       INTEGER :: n, k
       DOUBLE PRECISION, DIMENSION(*) :: b
       DOUBLE PRECISION :: res
     END FUNCTION norm_iface_d
       
     FUNCTION stopc_iface_d(x, b, r, ipar, dpar) RESULT(res)
       DOUBLE PRECISION, DIMENSION(*) :: x, b, r
       INTEGER, DIMENSION(*) :: ipar
       DOUBLE PRECISION, DIMENSION(*) :: dpar
     END FUNCTION stopc_iface_d

     SUBROUTINE mv_iface_c(x, r, ipar)
       COMPLEX, DIMENSION(*) :: x, r
       INTEGER, DIMENSION(*) :: ipar
     END SUBROUTINE mv_iface_c

     SUBROUTINE pc_iface_c(p, b, ipar)
       COMPLEX, DIMENSION(*) :: p, b
       INTEGER, DIMENSION(*) :: ipar
     END SUBROUTINE pc_iface_c

     FUNCTION dotp_iface_c(n, x, xinc, y, yinc) RESULT(res)
       INTEGER :: n, xinc, yinc
       COMPLEX, DIMENSION(*) :: x, y
       REAL :: res
     END FUNCTION dotp_iface_c

     FUNCTION norm_iface_c(n, b, k) RESULT(res)
       INTEGER :: n, k
       COMPLEX, DIMENSION(*) :: b
       REAL :: res
     END FUNCTION norm_iface_c
       
     FUNCTION stopc_iface_c(x, b, r, ipar, dpar) RESULT(res)
       COMPLEX, DIMENSION(*) :: x, b, r
       INTEGER, DIMENSION(*) :: ipar
       DOUBLE PRECISION, DIMENSION(*) :: dpar
     END FUNCTION stopc_iface_c

     SUBROUTINE mv_iface_z(x, r, ipar)
       DOUBLE COMPLEX, DIMENSION(*) :: x, r
       INTEGER, DIMENSION(*) :: ipar
     END SUBROUTINE mv_iface_z

     SUBROUTINE pc_iface_z(p, b, ipar)
       DOUBLE COMPLEX, DIMENSION(*) :: p, b
       INTEGER, DIMENSION(*) :: ipar
     END SUBROUTINE pc_iface_z

     FUNCTION dotp_iface_z(n, x, xinc, y, yinc) RESULT(res)
       INTEGER :: n, xinc, yinc
       DOUBLE COMPLEX, DIMENSION(*) :: x, y
       DOUBLE PRECISION :: res
     END FUNCTION dotp_iface_z

     FUNCTION norm_iface_z(n, b, k) RESULT(res)
       INTEGER :: n, k
       DOUBLE COMPLEX, DIMENSION(*) :: b
       DOUBLE PRECISION :: res
     END FUNCTION norm_iface_z
       
     FUNCTION stopc_iface_z(x, b, r, ipar, dpar) RESULT(res)
       DOUBLE COMPLEX, DIMENSION(*) :: x, b, r
       INTEGER, DIMENSION(*) :: ipar
       DOUBLE PRECISION, DIMENSION(*) :: dpar
     END FUNCTION stopc_iface_z
    END INTERFACE

    ! Iterator call, single precision
    INTERFACE
        SUBROUTINE huti_itercall_s(x, b, ipar, dpar, work, &
                             mvfun, pcondfun, pcondrfun, dotfun, normfun, stopcfun )
            IMPORT :: mv_iface_s, pc_iface_s, dotp_iface_s, norm_iface_s, stopc_iface_s
            IMPLICIT NONE
            INTEGER :: ipar(:)
            REAL, DIMENSION(:) :: x, b
            REAL :: dpar(:)
            REAL, DIMENSION(:,:) :: work
            PROCEDURE(mv_iface_s), POINTER :: mvfun
            PROCEDURE(pc_iface_s), POINTER :: pcondfun, pcondrfun
            PROCEDURE(dotp_iface_s), POINTER :: dotfun
            PROCEDURE(norm_iface_s), POINTER :: normfun
            PROCEDURE(stopc_iface_s), POINTER :: stopcfun
        END SUBROUTINE huti_itercall_s

        SUBROUTINE huti_itercall_d(x, b, ipar, dpar, work, &
                             mvfun, pcondfun, pcondrfun, dotfun, normfun, stopcfun )
            IMPORT :: mv_iface_d, pc_iface_d, dotp_iface_d, norm_iface_d, stopc_iface_d
            IMPLICIT NONE
            INTEGER :: ipar(:)
            DOUBLE PRECISION, DIMENSION(:) :: x, b
            REAL :: dpar(:)
            DOUBLE PRECISION, DIMENSION(:) :: work
            PROCEDURE(mv_iface_d), POINTER :: mvfun
            PROCEDURE(pc_iface_d), POINTER :: pcondfun, pcondrfun
            PROCEDURE(dotp_iface_d), POINTER :: dotfun
            PROCEDURE(norm_iface_d), POINTER :: normfun
            PROCEDURE(stopc_iface_d), POINTER :: stopcfun
        END SUBROUTINE huti_itercall_d

        SUBROUTINE huti_itercall_c(x, b, ipar, dpar, work, &
                             mvfun, pcondfun, pcondrfun, dotfun, normfun, stopcfun )
            IMPORT :: mv_iface_c, pc_iface_c, dotp_iface_c, norm_iface_c, stopc_iface_c
            IMPLICIT NONE
            INTEGER :: ipar(:)
            COMPLEX, DIMENSION(:) :: x, b
            REAL :: dpar(:)
            COMPLEX, DIMENSION(:) :: work
            PROCEDURE(mv_iface_c), POINTER :: mvfun
            PROCEDURE(pc_iface_c), POINTER :: pcondfun, pcondrfun
            PROCEDURE(dotp_iface_c), POINTER :: dotfun
            PROCEDURE(norm_iface_c), POINTER :: normfun
            PROCEDURE(stopc_iface_c), POINTER :: stopcfun
        END SUBROUTINE huti_itercall_c

        SUBROUTINE huti_itercall_z(x, b, ipar, dpar, work, &
                             mvfun, pcondfun, pcondrfun, dotfun, normfun, stopcfun )
            IMPORT :: mv_iface_z, pc_iface_z, dotp_iface_z, norm_iface_z, stopc_iface_z
            IMPLICIT NONE
            INTEGER :: ipar(:)
            DOUBLE COMPLEX, DIMENSION(:) :: x, b
            REAL :: dpar(:)
            DOUBLE COMPLEX, DIMENSION(:) :: work
            PROCEDURE(mv_iface_z), POINTER :: mvfun
            PROCEDURE(pc_iface_z), POINTER :: pcondfun, pcondrfun
            PROCEDURE(dotp_iface_z), POINTER :: dotfun
            PROCEDURE(norm_iface_z), POINTER :: normfun
            PROCEDURE(stopc_iface_z), POINTER :: stopcfun
        END SUBROUTINE huti_itercall_z
    END INTERFACE
END MODULE huti_interfaces
