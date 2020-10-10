using ChoThueXe.Model;
using ChoThueXe.Model.Models;
using ChoThueXe.Models;
using ChoThueXe.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChoThueXe.Web.infratructure.extensions
{
    public static class EntityExtensions
    {
        public static void UpdateApplicationGroup(this ApplicationGroup appGroup, ApplicationGroupViewModel appGroupViewModel)
        {
            appGroup.ID = appGroupViewModel.ID;
            appGroup.Name = appGroupViewModel.Name;
        }

        public static void UpdateApplicationRole(this ApplicationRole appRole, ApplicationRoleViewModel appRoleViewModel, string action = "add")
        {
            if (action == "update")
                appRole.Id = appRoleViewModel.Id;
            else
                appRole.Id = Guid.NewGuid().ToString();
            appRole.Name = appRoleViewModel.Name;
            appRole.Description = appRoleViewModel.Description;
        }
        public static void UpdateUser(this ApplicationUser appUser, ApplicationUserViewModel appUserViewModel, string action = "add")
        {

            appUser.Id = appUserViewModel.Id;
            appUser.FullName = appUserViewModel.FullName;
            appUser.BirthDay = appUserViewModel.BirthDay;
            appUser.Email = appUserViewModel.Email;
            appUser.UserName = appUserViewModel.UserName;
            appUser.PhoneNumber = appUserViewModel.PhoneNumber;
            appUser.Gioitinh = appUserViewModel.Gioitinh;

        }

        public static void Updatetbl_chucvu(this tbl_chucvu tbl_chucvu, tbl_chucvuViewModel tbl_chucvuVm)
        {
            tbl_chucvu.Macv = tbl_chucvuVm.Macv;
            tbl_chucvu.Tencv = tbl_chucvuVm.Tencv;
        }
        public static void Updatetbl_dangkyxe(this tbl_dangkyxe tbl_dangkyxe, tbl_dangkyxeViewModel tbl_dangkyxeVm)
        {
            tbl_dangkyxe.Sttphieu = tbl_dangkyxeVm.Sttphieu;
            tbl_dangkyxe.Sttxe = tbl_dangkyxeVm.Sttxe;
            tbl_dangkyxe.Ngaysd = tbl_dangkyxeVm.Ngaysd;
            tbl_dangkyxe.Tugio = tbl_dangkyxeVm.Tugio;
            tbl_dangkyxe.Dengio = tbl_dangkyxeVm.Dengio;
        }
        public static void Updatetbl_dinhgia(this tbl_dinhgia tbl_dinhgia, tbl_dinhgiaViewModel tbl_dinhgiaVm)
        {
            tbl_dinhgia.Mahangxe = tbl_dinhgiaVm.Mahangxe;
            tbl_dinhgia.Manv = tbl_dinhgiaVm.Manv;
            tbl_dinhgia.Thang = tbl_dinhgiaVm.Thang;
            tbl_dinhgia.Nam = tbl_dinhgiaVm.Nam;
            tbl_dinhgia.Giathue = tbl_dinhgiaVm.Giathue;
        } 
        public static void Updatetbl_hangxe(this tbl_hangxe tbl_hangxe, tbl_hangxeViewModel tbl_hangxeVm)
        {
            tbl_hangxe.Mahangxe = tbl_hangxeVm.Mahangxe;
            tbl_hangxe.Diengiai = tbl_hangxeVm.Diengiai;
        }
        public static void Updatetbl_khach(this tbl_khach tbl_khach, tbl_khachViewModel tbl_khachVm)
        {
            tbl_khach.Maso = tbl_khachVm.Maso;
            tbl_khach.Hotenkhach = tbl_khachVm.Hotenkhach;  
            tbl_khach.Sodt = tbl_khachVm.Sodt;  
            tbl_khach.Socmnd = tbl_khachVm.Socmnd;  
            tbl_khach.Gioitinh = tbl_khachVm.Gioitinh;  
        }
        public static void Updatetbl_laplichxe(this tbl_laplichxe tbl_laplichxe, tbl_laplichxeViewModel tbl_laplichxeVm)
        {
            tbl_laplichxe.Manv = tbl_laplichxeVm.Manv;
            tbl_laplichxe.Sttxe = tbl_laplichxeVm.Sttxe;
            tbl_laplichxe.Ngaydukien = tbl_laplichxeVm.Ngaydukien;
            tbl_laplichxe.Tugio = tbl_laplichxeVm.Tugio;
            tbl_laplichxe.Dengio = tbl_laplichxeVm.Dengio;
            tbl_laplichxe.DaThue = tbl_laplichxeVm.DaThue;
        }
        public static void Updatetbl_nhanvien(this tbl_nhanvien tbl_nhanvien, tbl_nhanvienViewModel tbl_nhanvienVm)
        {
            tbl_nhanvien.Manv = tbl_nhanvienVm.Manv;
            tbl_nhanvien.Hoten = tbl_nhanvienVm.Hoten;
            tbl_nhanvien.Gioitinh = tbl_nhanvienVm.Gioitinh;
            tbl_nhanvien.Namsinh = tbl_nhanvienVm.Namsinh;
            tbl_nhanvien.Sodt = tbl_nhanvienVm.Sodt;
            tbl_nhanvien.Macv = tbl_nhanvienVm.Macv;
        }
        public static void Updatetbl_phatsinhxe(this tbl_phatsinhxe tbl_phatsinhxe, tbl_phatsinhxeViewModel tbl_phatsinhxeVm)
        {
            tbl_phatsinhxe.Sttps = tbl_phatsinhxeVm.Sttps;
            tbl_phatsinhxe.Sttphieu = tbl_phatsinhxeVm.Sttphieu;
            tbl_phatsinhxe.Soxedkcu = tbl_phatsinhxeVm.Soxedkcu;
            tbl_phatsinhxe.Soxethay = tbl_phatsinhxeVm.Soxethay;
        }
        public static void Updatetbl_phieudk(this tbl_phieudk tbl_phieudk, tbl_phieudkViewModel tbl_phieudkVm)
        {
            tbl_phieudk.Sttphieu = tbl_phieudkVm.Sttphieu;
            tbl_phieudk.Ngayghi = tbl_phieudkVm.Ngayghi;
            tbl_phieudk.Manv = tbl_phieudkVm.Manv;
            tbl_phieudk.Maso = tbl_phieudkVm.Maso;
        }

         public static void Updatetbl_xe(this tbl_xe tbl_xe, tbl_xeViewModel tbl_xeVm)
        {
            tbl_xe.Sttxe = tbl_xeVm.Sttxe;
            tbl_xe.Banso = tbl_xeVm.Banso;
            tbl_xe.Hieuxe = tbl_xeVm.Hieuxe;
            tbl_xe.Mahangxe = tbl_xeVm.Mahangxe;
            tbl_xe.Sttxe = tbl_xeVm.Sttxe;
        }


    }
}
