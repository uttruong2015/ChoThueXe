using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Data.Repositories;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Service
{
    public interface ILoiService
    {
        Loi Create(Loi loi);
        void Save();
    }
    public class LoiService : ILoiService
    {
        ILoiRepository _loiRepository;
        IUnitOfWork _unitOfWork;
        public LoiService (ILoiRepository loiRepository, IUnitOfWork unitOfWork)
        {
            this._loiRepository = loiRepository;
            this._unitOfWork = unitOfWork;
        }
        public Loi Create(Loi loi)
        {
            return _loiRepository.Add(loi);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }
    }
}
