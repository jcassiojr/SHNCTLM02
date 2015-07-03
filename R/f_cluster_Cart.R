# carrega dados de CarteCArtoes para análise de cluster
f_cluster_Cart <- function(mm_aaaa)
{ 
    if (!requireNamespace("openxlsx", quietly = TRUE)) {
        stop("openxlsx needed for this function to work. Please install it.",
             call. = FALSE)
    } else {
        if(!require(openxlsx)){install.packages("openxlsx")}
    }  
    if (!requireNamespace("dplyr", quietly = TRUE)) {
        stop("dplyr needed for this function to work. Please install it.",
             call. = FALSE)
    } else {
        if(!require(dplyr)){install.packages("dplyr")}
    }  
    # mm_aaaa <- "06.2015"
    # le arquivo cartecartoes
    filein1 <- paste0("./tidydata/", mm_aaaa,"/tidyCarteCartoes.csv")
    df_carte <- read.csv(filein1, sep = ";")
    # seleciona somente as colunas desejadas para a analise de cluster
    df_carte <-
        df_carte %>%
        select(CHAINEORI,CANALAQU,NBBASE, MTTOT,NBFATURA, MTLMABASE, MTLMAABERTURA,
                    NBBASERET, NBBASE, NBATIVODIFZERO, NBATIVOMAIORQUATRO, 
                      NBATIVOMAIORZERO, QTDMOVIMENTADA, NBSEGURO)
    
    # acertando escala para CHAINEORI (subtraindo 9100000)
    df_carte <-
        df_carte %>%
        filter(CHAINEORI != 0) %>%
        mutate(CHAINEORI = CHAINEORI - 9100000)
        #select(CANALAQU, CHAINEORI, MTTOT, NBFATURA, MTLMABASE, MTLMAABERTURA,
        #     NBBASERET, NBBASE, NBATIVODIFZERO, NBATIVOMAIORQUATRO, 
        #       NBATIVOMAIORZERO, QTDMOVIMENTADA, NBSEGURO)
    #mudando valore de canalaqu para numericos
    # DIST = 1, BICO = 2, FIDE = 3, MIGR = 4
    df_carte <-
        df_carte %>%
        mutate (CANALAQU = ifelse (CANALAQU == "DIST",1,
                            ifelse (CANALAQU == "BICO",2,
                            ifelse (CANALAQU == "FIDE",3,4))))
    
    return(df_carte)    
}