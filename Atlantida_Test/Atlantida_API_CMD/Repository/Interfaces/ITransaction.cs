using Atlantida_API_CMD.DTO;

namespace Atlantida_API_CMD.Repository.Interfaces
{
    public interface ITransaction
    {
        int InsertarTransaction(TransactionDTO tr);
    }
}
