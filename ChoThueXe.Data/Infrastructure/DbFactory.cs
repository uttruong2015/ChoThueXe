
using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;

namespace ChoThueXe.Data.Infrastructure
{
    public class DbFactory : Disposable, IDbFactory
    {
        private QL_thuexeEntities dbContext;
       


        public QL_thuexeEntities Init()
        {
            return dbContext ?? (dbContext = new QL_thuexeEntities());
        }

        protected override void DisposeCore()
        {
            if (dbContext != null)
            { dbContext.Dispose();
               
            }

        }
       

       
    }
}