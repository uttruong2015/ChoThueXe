using ChoThueXe.Model;
using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Service
{
    public interface Itbl_nhanvienService
    {
        void Add(tbl_nhanvien tbl_nhanvien);
        void Update(tbl_nhanvien tbl_nhanvien);
        void delete(string id);
        IEnumerable<tbl_nhanvien> GetAll();
        tbl_nhanvien GetByID(int id);
        tbl_nhanvien GetByID(string id);
        void Commit();
        void Save();

    }
    public class tbl_nhanvienService : Itbl_nhanvienService
    {
        Itbl_nhanvienRepository _tbl_nhanvienRepository;
        IUnitOfWork _unitOfWork;
        public tbl_nhanvienService(Itbl_nhanvienRepository tbl_nhanvienRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_nhanvienRepository = tbl_nhanvienRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_nhanvien tbl_nhanvien)
        {
            _tbl_nhanvienRepository.Add(tbl_nhanvien);
        }
        public void Save()
        {
            _unitOfWork.Commit();
        }
        public void Commit()
        {
            _unitOfWork.Commit();
        }


        public void delete(string id)
        {
            _tbl_nhanvienRepository.Delete(id);
        }

        public IEnumerable<tbl_nhanvien> GetAll()
        {
            return _tbl_nhanvienRepository.GetAll();
        }

        public tbl_nhanvien GetByID(int id)
        {
            return _tbl_nhanvienRepository.GetSingleById(id);
        }



        public void Update(tbl_nhanvien tbl_nhanvien)
        {
            _tbl_nhanvienRepository.Update(tbl_nhanvien);
        }

        public tbl_nhanvien GetByID(string id)
        {
           return _tbl_nhanvienRepository.GetSingleById(id);
        }
    }
}