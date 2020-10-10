using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_phieudkRepository : IRepository<tbl_phieudk>
    {
        IEnumerable<layPhieuDangKy> layPhieuDangKy();
    }
    public class tbl_phieudkRepository : RepositoryBase<tbl_phieudk>, Itbl_phieudkRepository
    {
        public tbl_phieudkRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

        public IEnumerable<layPhieuDangKy> layPhieuDangKy()
        {
            var query = from a in DbContext.tbl_phieudk
                        join b in DbContext.tbl_dangkyxe
                        on a.Sttphieu equals b.Sttphieu
                        join c in DbContext.tbl_nhanvien
                        on a.Manv equals c.Manv
                        join d in DbContext.tbl_khach
                        on a.Maso equals d.Maso
                        join e in DbContext.tbl_xe
                        on b.Sttxe equals e.Sttxe
                        select new layPhieuDangKy()
                        {
                            Sttphieu = a.Sttphieu,
                            Ngayghi = a.Ngayghi,
                            Manv = a.Manv,
                            Maso = a.Maso,
                            Hoten = c.Hoten,
                            Hotenkhach = d.Hotenkhach,
                            Sttxe = e.Sttxe,
                            Banso = e.Banso,
                            Mahangxe = e.Mahangxe,
                            Hieuxe = e.Hieuxe,
                            Ngaysd = b.Ngaysd,
                            Tugio = b.Tugio,
                            Dengio = b.Dengio
                        };
            return query;
        }
    }
}
