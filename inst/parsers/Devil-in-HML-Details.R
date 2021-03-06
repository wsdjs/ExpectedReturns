
# The Devil in HML's Details: Factors, Monthly
## https://www.aqr.com/Insights/Datasets/The-Devil-in-HMLs-Details-Factors-Monthly

###--------------------------------------------------------------------------------#
 ## WARNING: Some countries factor returns parsed as char vectors. Needs formating ##
  #--------------------------------------------------------------------------------###

## Download to Sandbox

AQR_HML_Devil_file <- "https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/The-Devil-in-HMLs-Details-Factors-Monthly.xlsx"
download.file(AQR_HML_Devil_file, destfile = "sandbox/data/AQR_HML_Devil.xlsx")

## Load data from Sandbox
library(openxlsx)
path <- "sandbox/data/AQR_HML_Devil.xlsx"

### 1. Long/short High Minus Low Devil (HML Devil) factors

# NOTE (Vito): Switched 'HML_Devil.ExcessReturns' to 'HML_Devil.HML.DEV' as other factors.
#              If you already have your own code in place run:
#              HML_Devil.ExcessReturns <- HML_Devil.HML.DEV
HML_Devil.HML.DEV <- read.xlsx(path, sheet = 1, startRow = 18, colNames = FALSE)
    # NOTE: Due to .xlsx formatting, can't read in with column names automatically
    variable.names <- read.xlsx(path, sheet = 1, startRow = 17)
    colnames(HML_Devil.HML.DEV) <- variable.names[1,]
    rm(variable.names)

    HML_Devil.HML.DEV$DATE <- as.Date(HML_Devil.HML.DEV$DATE, format = "%m/%d/%Y")


### 2. Fama-French Factors
# NOTE (Vito): Switched 'HML_Devil.Mkt' to 'HML_Devil.MKT' for consistency with previous code.
#              If you already have your own code in place run:
#              HML_Devil.Mkt <- HML_Devil.MKT
HML_Devil.MKT <- read.xlsx(path, sheet = 5, startRow = 18, colNames = FALSE)
    # NOTE: Due to .xlsx formatting, can't read in with column names automatically
    variable.names <- read.xlsx(path, sheet = 5, startRow = 17)
    colnames(HML_Devil.MKT) <- variable.names[1,]
    rm(variable.names)

    HML_Devil.MKT$DATE <- as.Date(HML_Devil.MKT$DATE, format = "%m/%d/%Y")

HML_Devil.SMB <- read.xlsx(path, sheet = 6, startRow = 18, colNames = FALSE)
    # NOTE: Due to .xlsx formatting, can't read in with column names automatically
    variable.names <- read.xlsx(path, sheet = 6, startRow = 17)
    colnames(HML_Devil.SMB) <- variable.names[1,]
    rm(variable.names)

    HML_Devil.SMB$DATE <- as.Date(HML_Devil.SMB$DATE, format = "%m/%d/%Y")

HML_Devil.HML_FF <- read.xlsx(path, sheet = 7, startRow = 18, colNames = FALSE)
    # NOTE: Due to .xlsx formatting, can't read in with column names automatically
    variable.names <- read.xlsx(path, sheet = 7, startRow = 17)
    colnames(HML_Devil.HML_FF) <- variable.names[1,]
    rm(variable.names)

    HML_Devil.HML_FF$DATE <- as.Date(HML_Devil.HML_FF$DATE, format = "%m/%d/%Y")


### 3. Up Minus Down (UMD) factors
HML_Devil.UMD <- read.xlsx(path, sheet = 8, startRow = 18, colNames = FALSE)
    # NOTE: Due to .xlsx formatting, can't read in with column names automatically
    variable.names <- read.xlsx(path, sheet = 8, startRow = 17)
    colnames(HML_Devil.UMD) <- variable.names[1,]
    rm(variable.names)

    HML_Devil.UMD$DATE <- as.Date(HML_Devil.UMD$DATE, format = "%m/%d/%Y")

### 4. Total Market Value of Equity (ME) factors, lagged 1 month (Billion USD)
HML_Devil.ME_1 <- read.xlsx(path, sheet = 9, startRow = 19, colNames = FALSE)
    # NOTE: Due to .xlsx formatting, can't read in with column names automatically
    variable.names <- read.xlsx(path, sheet = 9, startRow = 18)
    colnames(HML_Devil.ME_1) <- variable.names[1,]
    rm(variable.names)

    HML_Devil.ME_1$DATE <- as.Date(HML_Devil.ME_1$DATE, format = "%m/%d/%Y")

### 5. RF: U.S. Treasury bill rates
    HML_Devil.RF <- read.xlsx(path, sheet = 10, startRow = 18, colNames = TRUE)

    HML_Devil.RF$DATE <- as.Date(HML_Devil.RF$DATE, format = "%m/%d/%Y")


## Add script to merge factor data by country below ##
