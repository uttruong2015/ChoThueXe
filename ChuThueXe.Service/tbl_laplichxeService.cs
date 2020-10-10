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
    public interface Itbl_laplichxeService
    {
        void Add(tbl_laplichxe tbl_laplichxe);
        void Update(tbl_laplichxe tbl_laplichxe);
        void delete(int id);
        IEnumerable<tbl_laplichxe> GetAll();
        tbl_laplichxe GetByID(string manv, string sttxe, DateTime ngaydukien, byte tugio);
        IEnumerable<tbl_laplichxe> laylichtheongay(DateTime ngaydukien);
        void xoatruockhithem(string sttxe, DateTime ngaydukien);
        void Commit();
        void Save();

    }
    public class tbl_laplichxeService : Itbl_laplichxeService
    {
        Itbl_laplichxeRepository _tbl_laplichxeRepository;
        IUnitOfWork _unitOfWork;
        public tbl_laplichxeService(Itbl_laplichxeRepository tbl_laplichxeRepository, IUnitOfWork unitOfWork)
        {
            this._tbl_laplichxeRepository = tbl_laplichxeRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Add(tbl_laplichxe tbl_laplichxe)
        {
            _tbl_laplichxeRepository.Add(tbl_laplichxe);
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
            _tbl_laplichxeRepository.Delete(id);
        }

        public IEnumerable<tbl_laplichxe> GetAll()
        {
            return _tbl_laplichxeRepository.GetAll();
        }

        public tbl_laplichxe GetByID(string manv, string sttxe, DateTime ngaydukien, byte tugio)
        {
            return _tbl_laplichxeRepository.GetSingleByCondition(x=>x.Manv==manv && x.Sttxe==sttxe &&x.Ngaydukien==ngaydukien &&x.Tugio==tugio);
        }



        public void Update(tbl_laplichxe tbl_laplichxe)
        {
            _tbl_laplichxeRepository.Update(tbl_laplichxe);
        }

        public void xoatruockhithem(string sttxe, DateTime ngaydukien)
        {
            string datetest = ngaydukien.ToShortDateString();
            var listtbl_laplichxetegory = _tbl_laplichxeRepository.GetAll().ToList();
            IEnumerable<tbl_laplichxe> coso = new List<tbl_laplichxe>();
            foreach (var item in listtbl_laplichxetegory)
            {
                string newngaydukien = item.Ngaydukien.ToShortDateString();
                if (item.Sttxe == sttxe && newngaydukien == datetest)
                {
                    _tbl_laplichxeRepository.Delete(item);
                }
            }
            
        }

        public IEnumerable<tbl_laplichxe> laylichtheongay(DateTime ngaydukien)
        {
            return _tbl_laplichxeRepository.laylichtheongay(ngaydukien);
        }
    }
}