package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello, GitHub Actions!d,我加了点东西",
		})
	})
	r.Run(":8080")
}
