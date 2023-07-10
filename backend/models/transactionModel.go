package models

import (
	"go.mongodb.org/mongo-driver/bson/primitive"
)

type Transaction struct {
	ID                 primitive.ObjectID `bson:"id"`
	Transaction_title  string             `json:"transaction_title" validate:"required"`
	Transaction_amount string             `json:"transaction_amount" validate:"required"`
	// Date               time.Time          `json:"date"`
	Transaction_id string `json:"transaction_id"`
	// User_id            string             `json:"user_id,omitempty" validate:"required"`
}
