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
    public interface Itbl_dangkyxeService
    {
        void Add(tbl_dangkyxe tbl_dangkyxe);
        void Update(tbl_dangkyxe tbl_dangkyxe);
        void delete(tbl_dangkyxe tbl_dangkyxe);
        IEnumerable<tbl_dangkyxe> GetAll();
        tbl_dangkyxe GetByID(string sttphieu, string sttxe, DateTime ngaysd, byte tugio );
        void Commit();
        void Save();

    }
    public class tbl_dangkyxeService : Itbl_dangkyxeService
    {
        Itbl_dangkyxeRepository _tbl_dangkyxeRepository;
        IUnitOfWork _unitOfWork;
        public tbl_dangkyxeService(Itbl_dangkyxeRepository tbl_dangkyxeRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_dangkyxeRepository = tbl_dangkyxeRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_dangkyxe tbl_dangkyxe)
        {
            _tbl_dangkyxeRepository.Add(tbl_dangkyxe);
        }
        public void Save()
        {
            _unitOfWork.Commit();
        }
        public void Commit()
        {
            _unitOfWork.Commit();
        }


        public void delete(tbl_dangkyxe tbl_dangkyxe)
        {
            _tbl_dangkyxeRepository.Delete(tbl_dangkyxe);
        }

        public IEnumerable<tbl_dangkyxe> GetAll()
        {
            return _tbl_dangkyxeRepository.GetAll();
        }

        public tbl_dangkyxe GetByID(string sttphieu, string sttxe, DateTime ngaysd, byte tugio)
        {
            return _tbl_dangkyxeRepository.GetSingleByCondition(x=>x.Sttphieu==sttphieu &&x.Sttxe==sttxe&&x.Ngaysd==ngaysd&&x.Tugio==tugio);
        }



        public void Update(tbl_dangkyxe tbl_dangkyxe)
        {
            _tbl_dangkyxeRepository.Update(tbl_dangkyxe);
        }

       
    }
}