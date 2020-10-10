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
    public interface Itbl_khachService
    {
        void Add(tbl_khach tbl_khach);
        void Update(tbl_khach tbl_khach);
        void delete(string id);
        IEnumerable<tbl_khach> GetAll(string keyword = null);
        tbl_khach GetByID(string id);
        void Commit();
        void Save();

    }
    public class tbl_khachService : Itbl_khachService
    {
        Itbl_khachRepository _tbl_khachRepository;
        IUnitOfWork _unitOfWork;
        public tbl_khachService(Itbl_khachRepository tbl_khachRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_khachRepository = tbl_khachRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_khach tbl_khach)
        {
            _tbl_khachRepository.Add(tbl_khach);
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
            _tbl_khachRepository.Delete(id);
        }

        public IEnumerable<tbl_khach> GetAll(string keyword = null)
        {
            if (!string.IsNullOrEmpty(keyword))
                return _tbl_khachRepository.GetMulti(x => x.Maso.Contains(keyword) || x.Hotenkhach.Contains(keyword) || x.Sodt.Contains(keyword) || x.Socmnd.Contains(keyword));
            else
                return _tbl_khachRepository.GetAll();
        }

        public tbl_khach GetByID(string id)
        {
            return _tbl_khachRepository.GetSingleById(id);
        }



        public void Update(tbl_khach tbl_khach)
        {
            _tbl_khachRepository.Update(tbl_khach);
        }

       
    }
}