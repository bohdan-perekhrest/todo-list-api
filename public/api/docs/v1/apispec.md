{
  "openapi": "3.0.0",
  "info": {
    "title": "API Documentation",
    "description": "",
    "version": "1.0"
  },
  "paths": {
    "/api/v1/tasks/{task_id}/comments": {
      "get": {
        "summary": "Get comments",
        "tags": [
          "Comments"
        ],
        "description": "",
        "parameters": [
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "1"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDc4NjIzNTd9.7WtwWd9G97yDK3YKjQ2UvtLlAUkizM6JM8e3RPGMA7s"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns a list of comments": {
                    "summary": "returns a list of comments",
                    "value": {
                      "data": [
                        {
                          "id": "1",
                          "type": "Comment",
                          "attributes": {
                            "Body": "Awesome_Body_1",
                            "Image": null
                          }
                        }
                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      },
      "post": {
        "summary": "Create comment",
        "tags": [
          "Comments"
        ],
        "description": "",
        "parameters": [
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "2"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2NDc4NjIzNTd9.jnQEoWR9E4t4ZlkAlTQa_-vp30_NYF3Y0rG-fImx1oU"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "returns bad request entity": {
                  "summary": "returns bad request entity",
                  "value": {
                    "comment": {
                      "body": ""
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "400": {
            "description": "Bad Request",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns bad request entity": {
                    "summary": "returns bad request entity",
                    "value": {
                      "errors": [
                        {
                          "source": {
                            "pointer": "/body"
                          },
                          "detail": "must be filled"
                        }
                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/api/v1/comments/{id}": {
      "delete": {
        "summary": "Destroy comment",
        "tags": [
          "Comments"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "3"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE2NDc4NjIzNTd9.vjYYqcdgjX9dyjlqJ7kazHhzSiIcEoL_KHqt-H-0Vdg"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "deletes the requested comment": {
                  "summary": "deletes the requested comment",
                  "value": {
                  }
                }
              }
            }
          }
        },
        "responses": {
          "204": {
            "description": "No Content",
            "content": {
              "any": {
              }
            },
            "headers": {
            }
          }
        }
      }
    },
    "/api/v1/projects": {
      "get": {
        "summary": "Get projects",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNjQ3ODYyMzU3fQ.Aj6yLSHZPdncpW6kYZGCEcMusOzQyHk62dhlJW61spY"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns a list of projects": {
                    "summary": "returns a list of projects",
                    "value": {
                      "data": [

                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      },
      "post": {
        "summary": "Create project",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywiZXhwIjoxNjQ3ODYyMzU3fQ.qNsNucBdKGndczpW3E6V34HTaoDa3GIvjGTNjmzXH5w"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "creates a new project": {
                  "summary": "creates a new project",
                  "value": {
                    "project": {
                      "title": "Project_5"
                    }
                  }
                },
                "returns bad request entity": {
                  "summary": "returns bad request entity",
                  "value": {
                    "project": {
                      "title": ""
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "Created",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "creates a new project": {
                    "summary": "creates a new project",
                    "value": {
                      "data": {
                        "id": "5",
                        "type": "Project",
                        "attributes": {
                          "Title": "Project_5"
                        },
                        "relationships": {
                          "User": {
                            "data": {
                              "id": "13",
                              "type": "User"
                            }
                          },
                          "Tasks": {
                            "data": [

                            ]
                          }
                        }
                      }
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "400": {
            "description": "Bad Request",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns bad request entity": {
                    "summary": "returns bad request entity",
                    "value": {
                      "errors": [
                        {
                          "source": {
                            "pointer": "/title"
                          },
                          "detail": "must be filled"
                        }
                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/api/v1/projects/{id}": {
      "get": {
        "summary": "Show project",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "4"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMSwiZXhwIjoxNjQ3ODYyMzU3fQ.XPK4QoHtjy2Usyv-M9Ns_i-AwKFVfY0YBT7kxiKO4Y4"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns a project": {
                    "summary": "returns a project",
                    "value": {
                      "data": {
                        "id": "4",
                        "type": "Project",
                        "attributes": {
                          "Title": "Project_4"
                        },
                        "relationships": {
                          "User": {
                            "data": {
                              "id": "11",
                              "type": "User"
                            }
                          },
                          "Tasks": {
                            "data": [

                            ]
                          }
                        }
                      }
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "404": {
            "description": "Not Found",
            "content": {
              "application/json": {
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json"
              }
            }
          }
        }
      },
      "put": {
        "summary": "Update project",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "6"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNSwiZXhwIjoxNjQ3ODYyMzU3fQ.fik0Gtsj_FpagSNVxAKHosuoeRGYBp8QPtOX08eJ_bE"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "updates the requested project": {
                  "summary": "updates the requested project",
                  "value": {
                    "project": {
                      "title": "New project"
                    }
                  }
                },
                "returns bad request entity": {
                  "summary": "returns bad request entity",
                  "value": {
                    "project": {
                      "title": ""
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "updates the requested project": {
                    "summary": "updates the requested project",
                    "value": {
                      "data": {
                        "id": "6",
                        "type": "Project",
                        "attributes": {
                          "Title": "New project"
                        },
                        "relationships": {
                          "User": {
                            "data": {
                              "id": "15",
                              "type": "User"
                            }
                          },
                          "Tasks": {
                            "data": [

                            ]
                          }
                        }
                      }
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "400": {
            "description": "Bad Request",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns bad request entity": {
                    "summary": "returns bad request entity",
                    "value": {
                      "errors": [
                        {
                          "source": {
                            "pointer": "/title"
                          },
                          "detail": "must be filled"
                        }
                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      },
      "delete": {
        "summary": "Destroy project",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "8"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNjQ3ODYyMzU3fQ.oMdGXaa4twEm2iQDyqieOUIPYQA0GNNvhqNuC4T-isI"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "deletes the requested project": {
                  "summary": "deletes the requested project",
                  "value": {
                  }
                }
              }
            }
          }
        },
        "responses": {
          "204": {
            "description": "No Content",
            "content": {
              "any": {
              }
            },
            "headers": {
            }
          }
        }
      }
    },
    "/api/v1/projects/{project_id}/tasks": {
      "get": {
        "summary": "Get tasks",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "9"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOCwiZXhwIjoxNjQ3ODYyMzU3fQ.ljEfPnq4BXMkUAsoO4s81VM_5wENA4-89ua14_zyZ5U"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns a list of tasks": {
                    "summary": "returns a list of tasks",
                    "value": {
                      "data": [
                        {
                          "id": "4",
                          "type": "Task",
                          "attributes": {
                            "Title": "Task_4",
                            "Done": false,
                            "DueDate": null,
                            "Position": 1,
                            "CommentsCount": 0
                          },
                          "relationships": {
                            "Comments": {
                              "data": [

                              ]
                            }
                          }
                        }
                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      },
      "post": {
        "summary": "Create task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "11"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMSwiZXhwIjoxNjQ3ODYyMzU3fQ.jkJkPofw1qfEm4PSdUitf0S2N_GJt9Hu8le945eCSgM"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "returns bad request entity": {
                  "summary": "returns bad request entity",
                  "value": {
                    "task": {
                      "title": 123,
                      "position": 4,
                      "done": false
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "400": {
            "description": "Bad Request",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns bad request entity": {
                    "summary": "returns bad request entity",
                    "value": {
                      "errors": [
                        {
                          "source": {
                            "pointer": "/title"
                          },
                          "detail": "must be a string"
                        }
                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/api/v1/tasks/{id}": {
      "get": {
        "summary": "Show task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "5"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOSwiZXhwIjoxNjQ3ODYyMzU3fQ.M8POic5u3mwzkpH88S851MITzLJT2ny_N-19jjLmoGg"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns a task": {
                    "summary": "returns a task",
                    "value": {
                      "data": {
                        "id": "5",
                        "type": "Task",
                        "attributes": {
                          "Title": "Task_5",
                          "Done": false,
                          "DueDate": null,
                          "Position": 1,
                          "CommentsCount": 0
                        },
                        "relationships": {
                          "Comments": {
                            "data": [

                            ]
                          }
                        }
                      }
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "401": {
            "description": "Unauthorized",
            "content": {
              "application/json": {
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json"
              }
            }
          }
        }
      },
      "put": {
        "summary": "Update task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "7"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwiZXhwIjoxNjQ3ODYyMzU3fQ.-L9buRmqqo5lbQaIOgrLJS1Btr-IKRSPKdlxfoE-Sd0"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "updates the requested task": {
                  "summary": "updates the requested task",
                  "value": {
                    "task": {
                      "title": "New task"
                    }
                  }
                },
                "returns bad request entity": {
                  "summary": "returns bad request entity",
                  "value": {
                    "task": {
                      "title": 123,
                      "position": 5,
                      "done": false
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "updates the requested task": {
                    "summary": "updates the requested task",
                    "value": {
                      "data": {
                        "id": "7",
                        "type": "Task",
                        "attributes": {
                          "Title": "New task",
                          "Done": false,
                          "DueDate": null,
                          "Position": 1,
                          "CommentsCount": 0
                        },
                        "relationships": {
                          "Comments": {
                            "data": [

                            ]
                          }
                        }
                      }
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          },
          "400": {
            "description": "Bad Request",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "returns bad request entity": {
                    "summary": "returns bad request entity",
                    "value": {
                      "errors": [
                        {
                          "source": {
                            "pointer": "/title"
                          },
                          "detail": "must be a string"
                        }
                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      },
      "delete": {
        "summary": "Destroy task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "9"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNCwiZXhwIjoxNjQ3ODYyMzU3fQ.3FS0xfko5yxYRiILtrL5KvxK8VNyCWPVOoG76xc_N7Q"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "deletes the requested task": {
                  "summary": "deletes the requested task",
                  "value": {
                  }
                }
              }
            }
          }
        },
        "responses": {
          "204": {
            "description": "No Content",
            "content": {
              "any": {
              }
            },
            "headers": {
            }
          }
        }
      }
    },
    "/api/v1/tasks/{id}/complete": {
      "put": {
        "summary": "Complete task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "10"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNSwiZXhwIjoxNjQ3ODYyMzU4fQ.YPPgSx4lDpHK-BRnIZLL2F5lYDBBCsk13ua0x8c2tDQ"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "complete the requested task": {
                  "summary": "complete the requested task",
                  "value": {
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "complete the requested task": {
                    "summary": "complete the requested task",
                    "value": {
                      "data": {
                        "id": "10",
                        "type": "Task",
                        "attributes": {
                          "Title": "Task_10",
                          "Done": true,
                          "DueDate": null,
                          "Position": 1,
                          "CommentsCount": 0
                        },
                        "relationships": {
                          "Comments": {
                            "data": [

                            ]
                          }
                        }
                      }
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      }
    },
    "/api/v1/tasks/{id}/position": {
      "put": {
        "summary": "Position task",
        "tags": [
          "Tasks"
        ],
        "description": "",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "11"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "HTTP_ACCESS_TOKEN",
            "in": "header",
            "example": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNiwiZXhwIjoxNjQ3ODYyMzU4fQ.IJ-9FjBAjkAYYJFYNkg0Wxy6aCuzz1zp-sXL-AdpYfg"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "change position the requested task": {
                  "summary": "change position the requested task",
                  "value": {
                    "task": {
                      "position": 2
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "change position the requested task": {
                    "summary": "change position the requested task",
                    "value": {
                      "data": {
                        "id": "11",
                        "type": "Task",
                        "attributes": {
                          "Title": "Task_11",
                          "Done": false,
                          "DueDate": null,
                          "Position": 1,
                          "CommentsCount": 0
                        },
                        "relationships": {
                          "Comments": {
                            "data": [

                            ]
                          }
                        }
                      }
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      }
    }
  },
  "tags": [
    {
      "name": "Comments",
      "description": ""
    },
    {
      "name": "Projects",
      "description": ""
    },
    {
      "name": "Tasks",
      "description": ""
    }
  ],
  "x-tagGroups": [
    {
      "name": "Comments",
      "tags": [
        "Comments"
      ]
    },
    {
      "name": "Projects",
      "tags": [
        "Projects"
      ]
    },
    {
      "name": "Tasks",
      "tags": [
        "Tasks"
      ]
    }
  ]
}
