public with sharing class AccountWrapperReturn {

    @AuraEnabled(cacheable=true)
    public static List<AccountWrapper> returnAccountWrapper() {
        List<Account> accountList = AccountQueryClass.getAccounts();
        List<AccountWrapper> awList = new List<AccountWrapper>();

        for(Account acc : accountList) {
            AccountWrapper aw = new AccountWrapper(acc);
            //in the video, we reassign the values of the aw AccountWrapper here,
            //but we don't need to because we have a constructor! This is my error.
            //video : https://www.youtube.com/watch?v=kxzoc7v9P0Y
            awList.add(aw);
        }

        return awList;
    }

    public class AccountWrapper {
        @auraEnabled public String Id;
        @auraEnabled public Decimal AnnualRevenue;
        @auraEnabled public String Name;
        @auraEnabled public String Type;
        
        public AccountWrapper(Account acc) {
            this.Id = acc.Id;
            this.AnnualRevenue = acc.AnnualRevenue;
            this.Name = acc.Name;
            this.Type = acc.Type;
        }
    }
}