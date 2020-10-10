using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_laplichxeRepository : IRepository<tbl_laplichxe>
    {
        IEnumerable<tbl_laplichxe> laylichtheongay(DateTime ngaydukien);

    }
    public class tbl_laplichxeRepository : RepositoryBase<tbl_laplichxe>, Itbl_laplichxeRepository
    {
        public tbl_laplichxeRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

        public IEnumerable<tbl_laplichxe> laylichtheongay(DateTime ngaydukien)
        {
            var query = from a in DbContext.tbl_laplichxe
                        where a.Ngaydukien == ngaydukien
                        select a;
            return query;
        }
    }
}
