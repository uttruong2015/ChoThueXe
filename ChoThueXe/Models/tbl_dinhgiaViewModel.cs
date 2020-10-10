using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChoThueXe.Models
{
    public class tbl_dinhgiaViewModel
    {
        public string Mahangxe { get; set; }
        public string Manv { get; set; }
        public short Thang { get; set; }
        public short Nam { get; set; }
        public Nullable<decimal> Giathue { get; set; }
    }
}