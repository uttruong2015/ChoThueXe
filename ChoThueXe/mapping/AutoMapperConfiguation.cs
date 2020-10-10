using AutoMapper;
using ChoThueXe.Model;
using ChoThueXe.Model.Models;
using ChoThueXe.Models;
using ChoThueXe.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChoThueXe.Web.mapping
{
    public class AutoMapperConfiguation
    {
        public static void Configure()
        {
            Mapper.CreateMap<ApplicationGroup, ApplicationGroupViewModel>();
            Mapper.CreateMap<ApplicationRole, ApplicationRoleViewModel>();
            Mapper.CreateMap<ApplicationUser, ApplicationUserViewModel>();


            Mapper.CreateMap<tbl_chucvu, tbl_chucvuViewModel>();
            Mapper.CreateMap<tbl_dangkyxe, tbl_dangkyxeViewModel>();
            Mapper.CreateMap<tbl_dinhgia, tbl_dinhgiaViewModel>();
            Mapper.CreateMap<tbl_hangxe, tbl_hangxeViewModel>();
            Mapper.CreateMap<tbl_khach, tbl_khachViewModel>();
            Mapper.CreateMap<tbl_laplichxe, tbl_laplichxeViewModel>();
            Mapper.CreateMap<tbl_nhanvien, tbl_nhanvienViewModel>();
            Mapper.CreateMap<tbl_phatsinhxe, tbl_phatsinhxeViewModel>();
            Mapper.CreateMap<tbl_phieudk, tbl_phieudkViewModel>();
            Mapper.CreateMap<tbl_xe, tbl_xeViewModel>();
            Mapper.CreateMap<tbl_hangxe, gopHangXeVaXe>();
            
        }
    }
}