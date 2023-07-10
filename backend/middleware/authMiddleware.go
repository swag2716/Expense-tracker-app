package middleware

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/swapnika/jwt-auth/helpers"
)

func Authenticate() gin.HandlerFunc {
	return func(c *gin.Context) {
		clientToken := c.Request.Header.Get("token")
		refreshToken := c.Request.Header.Get("refresh-token")
		if clientToken == "" || refreshToken == "" {
			c.JSON(http.StatusBadRequest, gin.H{"error": fmt.Sprintln("No authorization header provided")})
			c.Abort()
			return
		}

		claims, err := helpers.ValidateToken(clientToken)
		if err != "" {
			refreshClaims, err := helpers.ValidateToken(refreshToken)
			if err != "" {
				c.JSON(http.StatusUnauthorized, gin.H{"error": err})
				c.Abort()
				return
			}
			helpers.UpdateAllTokens(clientToken, refreshToken, refreshClaims.Uid)
			c.Set("email", refreshClaims.Email)
			c.Set("first_name", refreshClaims.Name)
			c.Set("uid", refreshClaims.Uid)
			c.JSON(http.StatusOK, refreshClaims)
			c.Next()

		} else {
			c.Set("email", claims.Email)
			c.Set("first_name", claims.Name)
			c.Set("uid", claims.Uid)

			c.JSON(http.StatusOK, claims)
			c.Next()
		}

	}
}
