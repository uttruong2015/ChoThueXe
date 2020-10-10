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
    public interface Itbl_hangxeService
    {
        void Add(tbl_hangxe tbl_hangxe);
        void Update(tbl_hangxe tbl_hangxe);
        void delete(string id);
        IEnumerable<tbl_hangxe> GetAll(string filter=null);
        tbl_hangxe GetByID(string id);
        void Commit();
        void Save();

    }
    public class tbl_hangxeService : Itbl_hangxeService
    {
        Itbl_hangxeRepository _tbl_hangxeRepository;
        IUnitOfWork _unitOfWork;
        public tbl_hangxeService(Itbl_hangxeRepository tbl_hangxeRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_hangxeRepository = tbl_hangxeRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_hangxe tbl_hangxe)
        {
            _tbl_hangxeRepository.Add(tbl_hangxe);
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
            _tbl_hangxeRepository.Delete(id);
        }

        public IEnumerable<tbl_hangxe> GetAll(string filter = null)
        {
            if (!string.IsNullOrEmpty(filter))
                return _tbl_hangxeRepository.GetMulti(x => x.Mahangxe.Contains(filter) || x.Diengiai.Contains(filter));
            else
                return _tbl_hangxeRepository.GetAll();
        }

        public tbl_hangxe GetByID(string id)
        {
            return _tbl_hangxeRepository.GetSingleById(id);
        }



        public void Update(tbl_hangxe tbl_hangxe)
        {
            _tbl_hangxeRepository.Update(tbl_hangxe);
        }

       
    }
}