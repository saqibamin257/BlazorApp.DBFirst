namespace BlazorApp.DBFirst.Server.Interfaces
{
    public interface IUserInformation
    {
        public bool IsAuthenticUser(string usedId, string password);
    }
}
