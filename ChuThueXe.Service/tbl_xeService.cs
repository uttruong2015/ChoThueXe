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
    public interface Itbl_xeService
    {
        void Add(tbl_xe tbl_xe);
        void Update(tbl_xe tbl_xe);
        void delete(string id);
        IEnumerable<tbl_xe> GetAll(string keyword = null);
        IEnumerable<tbl_xe> GetByHangXe(string mahangxe);
        tbl_xe GetByID(string id);
        void Commit();
        void Save();

    }
    public class tbl_xeService : Itbl_xeService
    {
        Itbl_xeRepository _tbl_xeRepository;
        IUnitOfWork _unitOfWork;
        public tbl_xeService(Itbl_xeRepository tbl_xeRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_xeRepository = tbl_xeRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_xe tbl_xe)
        {
            _tbl_xeRepository.Add(tbl_xe);
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
            _tbl_xeRepository.Delete(id);
        }

        public IEnumerable<tbl_xe> GetAll(string keyword = null)
        {
            if (!string.IsNullOrEmpty(keyword))
                return _tbl_xeRepository.GetMulti(x => x.Sttxe.Contains(keyword) || x.Banso.Contains(keyword) || x.Hieuxe.Contains(keyword)||x.Mahangxe.Contains(keyword));
            else
                return _tbl_xeRepository.GetAll();
        }

        public tbl_xe GetByID(string id)
        {
            return _tbl_xeRepository.GetSingleById(id);
        }



        public void Update(tbl_xe tbl_xe)
        {
            _tbl_xeRepository.Update(tbl_xe);
        }

        public IEnumerable<tbl_xe> GetByHangXe(string mahangxe)
        {
            return _tbl_xeRepository.GetMulti(x => x.Mahangxe == mahangxe);
        }
    }
}