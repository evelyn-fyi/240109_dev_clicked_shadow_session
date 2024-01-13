public without sharing class AccountQueryClass {
    public static List<Account> getAccounts() {
        return [SELECT
                    Id,
                    AnnualRevenue,
                    Name,
                    Type
                FROM
                    Account
                ORDER BY AnnualRevenue DESC NULLS LAST LIMIT 5];
    }
}