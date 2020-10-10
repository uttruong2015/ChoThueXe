using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChoThueXe.Models
{
    public class tbl_laplichxeViewModel
    {
        public string Manv { get; set; }
        public string Sttxe { get; set; }
        public System.DateTime Ngaydukien { get; set; }
        public byte Tugio { get; set; }
        public Nullable<byte> Dengio { get; set; }
        public Nullable<bool> DaThue { get; set; }

    }
}