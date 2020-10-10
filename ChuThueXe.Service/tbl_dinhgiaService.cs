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
    public interface Itbl_dinhgiaService
    {
        void Add(tbl_dinhgia tbl_dinhgia);
        void Update(tbl_dinhgia tbl_dinhgia);
        void delete(int id);
        IEnumerable<tbl_dinhgia> GetAll();
        tbl_dinhgia GetByID(string mahangxe, string manv, short thang, short nam);
        void Commit();
        void Save();

    }
    public class tbl_dinhgiaService : Itbl_dinhgiaService
    {
        Itbl_dinhgiaRepository _tbl_dinhgiaRepository;
        IUnitOfWork _unitOfWork;
        public tbl_dinhgiaService(Itbl_dinhgiaRepository tbl_dinhgiaRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_dinhgiaRepository = tbl_dinhgiaRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_dinhgia tbl_dinhgia)
        {
            _tbl_dinhgiaRepository.Add(tbl_dinhgia);
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
            _tbl_dinhgiaRepository.Delete(id);
        }

        public IEnumerable<tbl_dinhgia> GetAll()
        {
            return _tbl_dinhgiaRepository.GetAll();
        }

        public tbl_dinhgia GetByID(string mahangxe, string manv, short thang, short nam)
        {
            return _tbl_dinhgiaRepository.GetSingleByCondition(x=>x.Mahangxe==mahangxe&&x.Manv==manv&&x.Thang==thang&&x.Nam==nam);
        }



        public void Update(tbl_dinhgia tbl_dinhgia)
        {
            _tbl_dinhgiaRepository.Update(tbl_dinhgia);
        }

       
    }
}