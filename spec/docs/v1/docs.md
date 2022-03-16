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
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "47"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "gets comments": {
                    "summary": "gets comments",
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
        "summary": "Create comment",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "task_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "48"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "requestBody": {
          "content": {
            "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5": {
              "examples": {
                "POST comments": {
                  "summary": "POST comments",
                  "value": "comment[body]=some+body"
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
                  "POST comments": {
                    "summary": "POST comments",
                    "value": {
                      "data": {
                        "id": "5",
                        "type": "Comment",
                        "attributes": {
                          "Body": "some body",
                          "Image": null
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
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "gets projects": {
                    "summary": "gets projects",
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
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "requestBody": {
          "content": {
            "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5": {
              "examples": {
                "creates project": {
                  "summary": "creates project",
                  "value": "project[title]=some+title"
                },
                "updates project": {
                  "summary": "updates project",
                  "value": "project[title]=changed+title"
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
                  "creates project": {
                    "summary": "creates project",
                    "value": {
                      "data": {
                        "id": "127",
                        "type": "Project",
                        "attributes": {
                          "Title": "some title"
                        },
                        "relationships": {
                          "User": {
                            "data": {
                              "id": "163",
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
                  },
                  "updates project": {
                    "summary": "updates project",
                    "value": {
                      "data": {
                        "id": "128",
                        "type": "Project",
                        "attributes": {
                          "Title": "changed title"
                        },
                        "relationships": {
                          "User": {
                            "data": {
                              "id": "164",
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
                },
                "schema": {
                  "$ref": "/Users/bogdan.perekhrest/Desktop/garage/todo/spec/support/v1/schemas/namespace/projects_s.json"
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
            "example": "129"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "updates project": {
                    "summary": "updates project",
                    "value": {
                      "data": {
                        "id": "129",
                        "type": "Project",
                        "attributes": {
                          "Title": "some title"
                        },
                        "relationships": {
                          "User": {
                            "data": {
                              "id": "165",
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
            "example": "130"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
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
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "131"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "gets tasks": {
                    "summary": "gets tasks",
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
        "summary": "Create task",
        "tags": [
          "Projects"
        ],
        "description": "",
        "parameters": [
          {
            "name": "project_id",
            "in": "path",
            "schema": {
              "type": "number"
            },
            "example": "132"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "requestBody": {
          "content": {
            "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5": {
              "examples": {
                "creates task": {
                  "summary": "creates task",
                  "value": "task[title]=some+title"
                },
                "updates task": {
                  "summary": "updates task",
                  "value": "task[title]=changed+title"
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
                  "creates task": {
                    "summary": "creates task",
                    "value": {
                      "data": {
                        "id": "50",
                        "type": "Task",
                        "attributes": {
                          "Title": "some title",
                          "Done": false,
                          "DueDate": null,
                          "Position": 0,
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
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "updates task": {
                    "summary": "updates task",
                    "value": {
                      "data": {
                        "id": "51",
                        "type": "Task",
                        "attributes": {
                          "Title": "changed title",
                          "Done": false,
                          "DueDate": null,
                          "Position": null,
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
    "/api/v1/tasks/{id}": {
      "get": {
        "summary": "Show task",
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
            "example": "52"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "updates task": {
                    "summary": "updates task",
                    "value": {
                      "data": {
                        "id": "52",
                        "type": "Task",
                        "attributes": {
                          "Title": "some title",
                          "Done": false,
                          "DueDate": null,
                          "Position": null,
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
      },
      "delete": {
        "summary": "Destroy task",
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
            "example": "53"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
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
      "patch": {
        "summary": "Complete task",
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
            "example": "54"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "updates status of task": {
                    "summary": "updates status of task",
                    "value": {
                      "data": {
                        "id": "54",
                        "type": "Task",
                        "attributes": {
                          "Title": "some title",
                          "Done": true,
                          "DueDate": null,
                          "Position": null,
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
      "patch": {
        "summary": "Position task",
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
            "example": "55"
          },
          {
            "name": "Accept",
            "in": "header",
            "example": "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/x-www-form-urlencoded"
          }
        ],
        "requestBody": {
          "content": {
            "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5": {
              "examples": {
                "updates position of task": {
                  "summary": "updates position of task",
                  "value": "task[position]=2"
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
                  "updates position of task": {
                    "summary": "updates position of task",
                    "value": {
                      "data": {
                        "id": "55",
                        "type": "Task",
                        "attributes": {
                          "Title": "some title",
                          "Done": false,
                          "DueDate": null,
                          "Position": 2,
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
      "name": "Projects",
      "description": ""
    }
  ],
  "x-tagGroups": [
    {
      "name": "Projects",
      "tags": [
        "Projects"
      ]
    }
  ]
}
