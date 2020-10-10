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
    public interface Itbl_phieudkService
    {
        void Add(tbl_phieudk tbl_phieudk);
        void Update(tbl_phieudk tbl_phieudk);
        void delete(string id);
        IEnumerable<tbl_phieudk> GetAll();
        tbl_phieudk GetByID(string id);
        void Commit();
        void Save();
        IEnumerable<layPhieuDangKy> layPhieuDangKy();

    }
    public class tbl_phieudkService : Itbl_phieudkService
    {
        Itbl_phieudkRepository _tbl_phieudkRepository;
        IUnitOfWork _unitOfWork;
        public tbl_phieudkService(Itbl_phieudkRepository tbl_phieudkRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_phieudkRepository = tbl_phieudkRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_phieudk tbl_phieudk)
        {
            _tbl_phieudkRepository.Add(tbl_phieudk);
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
            _tbl_phieudkRepository.Delete(id);
        }

        public IEnumerable<tbl_phieudk> GetAll()
        {
            return _tbl_phieudkRepository.GetAll();
        }

        public tbl_phieudk GetByID(string id)
        {
            return _tbl_phieudkRepository.GetSingleById(id);
        }



        public void Update(tbl_phieudk tbl_phieudk)
        {
            _tbl_phieudkRepository.Update(tbl_phieudk);
        }

        public IEnumerable<layPhieuDangKy> layPhieuDangKy()
        {
            return _tbl_phieudkRepository.layPhieuDangKy();
        }
    }
}