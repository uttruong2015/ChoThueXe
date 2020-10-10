using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChoThueXe.Models
{
    public class tbl_dangkyxeViewModel
    {
        public string Sttphieu { get; set; }
        public string Sttxe { get; set; }
        public System.DateTime Ngaysd { get; set; }
        public byte Tugio { get; set; }
        public Nullable<byte> Dengio { get; set; }
    }
}