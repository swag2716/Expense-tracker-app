package transactionControllers

import (
	"context"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/swapnika/jwt-auth/models"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

func AddTransaction() gin.HandlerFunc {
	return func(c *gin.Context) {
		ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()

		var transaction models.Transaction

		if err := c.BindJSON(&transaction); err != nil {
			log.Fatal("error in binding", err)
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		validationErr := validate.Struct(transaction)

		if validationErr != nil {
			log.Fatal("Validation Error", validationErr)
			c.JSON(http.StatusBadRequest, gin.H{"error": validationErr.Error()})
			return
		}

		transaction.ID = primitive.NewObjectID()
		transaction.Transaction_id = transaction.ID.Hex()

		transaction.Date = time.Now()

		_, insertErr := transactionCollection.InsertOne(ctx, transaction)

		if insertErr != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": insertErr.Error()})
			return
		}

		c.JSON(http.StatusOK, transaction)

	}
}
