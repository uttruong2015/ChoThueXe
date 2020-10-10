using ChoThueXe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChoThueXe.Model
{
    public class gopHangXeVaXe
    {
        public string Mahangxe { get; set; }
        public string Diengiai { get; set; }
        public IEnumerable<tbl_xeViewModel> xe { get; set; }
    }
}