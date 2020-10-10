using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_dinhgiaRepository : IRepository<tbl_dinhgia>
    {
    }
    public class tbl_dinhgiaRepository : RepositoryBase<tbl_dinhgia>, Itbl_dinhgiaRepository
    {
        public tbl_dinhgiaRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

       
    }
}
