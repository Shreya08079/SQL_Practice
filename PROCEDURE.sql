
USE SelectPracticeDB;
GO

UPDATE CustomerInfo
SET       City = 'Jamshedpur'
WHERE (CustomerId = 1) AND (CustomerName = 'Shreya')
SELECT * From dbo.CustomerInfo;


CREATE PROCEDURE UpdateCustomerCity
    @CustomerId INT,
    @CustomerName VARCHAR(100),
    @City VARCHAR(50)

    AS
BEGIN
    UPDATE dbo.CustomerInfo
    SET City = @City
    WHERE CustomerId = @CustomerId
      AND CustomerName = @CustomerName;

    SELECT * FROM dbo.CustomerInfo;
END
GO


CREATE PROCEDURE dbo.ManagingCust
    @Action VARCHAR(10),
    @CustomerId INT,
    @CustomerName VARCHAR(100) = NULL,
    @City VARCHAR(50) = NULL,
    @CustomerType VARCHAR(50) = NULL,
    @IsActive BIT = 1,
    @CreatedDate DATE = NULL
AS
BEGIN
    -- INSERT
    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO dbo.CustomerInfo
        (CustomerId, CustomerName, City, CustomerType, IsActive, CreatedDate)
        VALUES
        (
            @CustomerId,
            @CustomerName,
            @City,
            @CustomerType,
            @IsActive,
            ISNULL(@CreatedDate, GETDATE())
        );
    END

    -- UPDATE
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE dbo.CustomerInfo
        SET CustomerName = @CustomerName,
            City = @City,
            CustomerType = @CustomerType,
            IsActive = @IsActive
        WHERE CustomerId = @CustomerId;
    END

    -- DELETE
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM dbo.CustomerInfo
        WHERE CustomerId = @CustomerId;
    END

    -- SHOW RESULT
    SELECT * FROM dbo.CustomerInfo;
END
GO
EXEC dbo.ManagingCust
    @Action = 'INSERT',
    @CustomerId = 8,
    @CustomerName = 'Amit',
    @City = 'Delhi',
    @CustomerType = 'Regular',
    @IsActive = 1,
    @CreatedDate = '2025-10-10';

