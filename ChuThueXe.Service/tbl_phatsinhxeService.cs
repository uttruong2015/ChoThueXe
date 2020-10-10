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
    public interface Itbl_phatsinhxeService
    {
        void Add(tbl_phatsinhxe tbl_phatsinhxe);
        void Update(tbl_phatsinhxe tbl_phatsinhxe);
        void delete(int id);
        IEnumerable<tbl_phatsinhxe> GetAll();
        tbl_phatsinhxe GetByID(int id);
        void Commit();
        void Save();

    }
    public class tbl_phatsinhxeService : Itbl_phatsinhxeService
    {
        Itbl_phatsinhxeRepository _tbl_phatsinhxeRepository;
        IUnitOfWork _unitOfWork;
        public tbl_phatsinhxeService(Itbl_phatsinhxeRepository tbl_phatsinhxeRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_phatsinhxeRepository = tbl_phatsinhxeRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_phatsinhxe tbl_phatsinhxe)
        {
            _tbl_phatsinhxeRepository.Add(tbl_phatsinhxe);
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
            _tbl_phatsinhxeRepository.Delete(id);
        }

        public IEnumerable<tbl_phatsinhxe> GetAll()
        {
            return _tbl_phatsinhxeRepository.GetAll();
        }

        public tbl_phatsinhxe GetByID(int id)
        {
            return _tbl_phatsinhxeRepository.GetSingleById(id);
        }



        public void Update(tbl_phatsinhxe tbl_phatsinhxe)
        {
            _tbl_phatsinhxeRepository.Update(tbl_phatsinhxe);
        }

       
    }
}