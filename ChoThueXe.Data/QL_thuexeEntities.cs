using ChoThueXe.Model;
using ChoThueXe.Model.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace ChoThueXe.Data
{
    public partial class QL_thuexeEntities : IdentityDbContext<ApplicationUser>
    {
        public QL_thuexeEntities() : base("QL_thuexeEntities")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }
        public DbSet<ApplicationGroup> ApplicationGroups { set; get; }
        public DbSet<ApplicationRole> ApplicationRoles { set; get; }
        public DbSet<ApplicationRoleGroup> ApplicationRoleGroups { set; get; }
        public DbSet<ApplicationUserGroup> ApplicationUserGroups { set; get; }
        public  DbSet<tbl_chucvu> tbl_chucvu { get; set; }
        public  DbSet<tbl_dangkyxe> tbl_dangkyxe { get; set; }
        public  DbSet<tbl_dinhgia> tbl_dinhgia { get; set; }
        public  DbSet<tbl_hangxe> tbl_hangxe { get; set; }
        public  DbSet<tbl_khach> tbl_khach { get; set; }
        public  DbSet<tbl_laplichxe> tbl_laplichxe { get; set; }
        public  DbSet<tbl_nhanvien> tbl_nhanvien { get; set; }
        public  DbSet<tbl_phatsinhxe> tbl_phatsinhxe { get; set; }
        public  DbSet<tbl_phieudk> tbl_phieudk { get; set; }
        public  DbSet<tbl_xe> tbl_xe { get; set; }

        protected override void OnModelCreating(DbModelBuilder builder)
        {
            builder.Entity<IdentityUserRole>().HasKey(i => new { i.UserId, i.RoleId }).ToTable("ApplicationUserRoles");
            builder.Entity<IdentityUserLogin>().HasKey(i => i.UserId).ToTable("ApplicationUserLogins");
            builder.Entity<IdentityRole>().ToTable("ApplicationRoles");
            builder.Entity<IdentityUserClaim>().HasKey(i => i.UserId).ToTable("ApplicationUserClaims");
        }
        public static QL_thuexeEntities Create()
        {
            return new QL_thuexeEntities();
        }
    }
}
