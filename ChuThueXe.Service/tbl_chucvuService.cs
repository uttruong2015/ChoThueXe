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
    public interface Itbl_chucvuService
    {
        void Add(tbl_chucvu tbl_chucvu);
        void Update(tbl_chucvu tbl_chucvu);
        void delete(int id);
        IEnumerable<tbl_chucvu> GetAll();
        tbl_chucvu GetByID(int id);
        void Commit();
        void Save();

    }
    public class tbl_chucvuService : Itbl_chucvuService
    {
        Itbl_chucvuRepository _tbl_chucvuRepository;
        IUnitOfWork _unitOfWork;
        public tbl_chucvuService(Itbl_chucvuRepository tbl_chucvuRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_chucvuRepository = tbl_chucvuRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_chucvu tbl_chucvu)
        {
            _tbl_chucvuRepository.Add(tbl_chucvu);
        }
        public void Save()
        {
            _unitOfWork.Commit();
        }
        public void Commit()
        {
            _unitOfWork.Commit();
        }


        public void delete(int id)
        {
            _tbl_chucvuRepository.Delete(id);
        }

        public IEnumerable<tbl_chucvu> GetAll()
        {
            return _tbl_chucvuRepository.GetAll();
        }

        public tbl_chucvu GetByID(int id)
        {
            return _tbl_chucvuRepository.GetSingleById(id);
        }



        public void Update(tbl_chucvu tbl_chucvu)
        {
            _tbl_chucvuRepository.Update(tbl_chucvu);
        }

       
    }
}