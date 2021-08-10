const books = require('./data')
const { nanoid } = require('nanoid')

const addBookHandler = (request, h) => {
  const { name, year, author, summary, publisher, pageCount, readPage, reading } = request.payload

  if (name === undefined) {
    const response = h.response({
      status: 'fail',
      message: 'Gagal menambahkan buku. Mohon isi nama buku'
    })
    response.code(400)
    return response
  }

  if (readPage > pageCount) {
    const response = h.response({
      status: 'fail',
      message: 'Gagal menambahkan buku. readPage tidak boleh lebih besar dari pageCount'
    })
    response.code(400)
    return response
  }

  const id = nanoid(16)
  const insertedAt = new Date().toISOString()
  const updatedAt = insertedAt
  const finished = !!(readPage === pageCount)
  const newBook = {
    id, name, year, author, summary, publisher, pageCount, readPage, finished, reading, insertedAt, updatedAt
  }

  books.push(newBook)

  const isSuccess = books.filter(book => book.id === id).length > 0
  if (isSuccess) {
    const response = h.response({
      status: 'success',
      message: 'Buku berhasil ditambahkan',
      data: {
        bookId: id
      }
    })
    response.code(201)
    return response
  }

  const response = h.response({
    status: 'fail',
    message: 'Gagal menambkan buku'
  })
  response.code(500)
  return response
}

const getAllBook = () => {
  const newBooks = []

  for (const temp of books) {
    const { id, name, publisher } = temp

    newBooks.push({ id, name, publisher })
  }

  return newBooks
}

const getAllBookReading = (readingParam) => {
  const newBooks = []

  for (const temp of books) {
    const { id, name, publisher, reading } = temp

    if (reading === readingParam) {
      newBooks.push({ id, name, publisher })
    }
  }

  return newBooks
}

const getAllBookFinished = (finishedParam) => {
  const newBooks = []

  for (const temp of books) {
    const { id, name, publisher, finished } = temp

    if (finished === finishedParam) {
      newBooks.push({ id, name, publisher })
    }
  }

  return newBooks
}

const getAllBookByName = (nameParam) => {
  const newBooks = []

  for (const temp of books) {
    const { id, name, publisher } = temp

    if (name.toLowerCase().includes(nameParam.toLowerCase())) {
      newBooks.push({ id, name, publisher })
    }
  }

  return newBooks
}

const getAllBookHandler = (request, h) => {
  const { reading, finished, name } = request.query

  if (reading === '1' || reading === '0') {
    return {
      status: 'success',
      data: {
        books: getAllBookReading(reading === '1')
      }
    }
  }

  if (finished === '1' || finished === '0') {
    return {
      status: 'success',
      data: {
        books: getAllBookFinished(finished === '1')
      }
    }
  }

  if (name !== undefined) {
    return {
      status: 'success',
      data: {
        books: getAllBookByName(name)
      }
    }
  }

  return {
    status: 'success',
    data: {
      books: getAllBook()
    }
  }
}

const getBookByIdHandler = (request, h) => {
  const { bookId } = request.params
  const book = books.filter(b => b.id === bookId)[0]

  if (book !== undefined) {
    return {
      status: 'success',
      data: {
        book
      }
    }
  }

  const response = h.response({
    status: 'fail',
    message: 'Buku tidak ditemukan'
  })
  response.code(404)
  return response
}

const editBookByIdHandler = (request, h) => {
  const { bookId } = request.params
  const index = books.findIndex(b => b.id === bookId)

  if (index !== -1) {
    const { name, year, author, summary, publisher, pageCount, readPage, reading } = request.payload

    if (name === undefined) {
      const response = h.response({
        status: 'fail',
        message: 'Gagal memperbarui buku. Mohon isi nama buku'
      })
      response.code(400)
      return response
    }

    if (readPage > pageCount) {
      const response = h.response({
        status: 'fail',
        message: 'Gagal memperbarui buku. readPage tidak boleh lebih besar dari pageCount'
      })
      response.code(400)
      return response
    }

    const updatedAt = new Date().toISOString()
    const finished = !!(readPage === pageCount)

    books[index] = {
      ...books[index],
      name,
      year,
      author,
      summary,
      publisher,
      pageCount,
      readPage,
      finished,
      reading,
      updatedAt
    }

    const response = h.response({
      status: 'success',
      message: 'Buku berhasil diperbarui'
    })
    response.code(200)
    return response
  }

  const response = h.response({
    status: 'fail',
    message: 'Gagal memperbarui buku. Id tidak ditemukan'
  })
  response.code(404)
  return response
}

const deleteBookByIdHandler = (request, h) => {
  const { bookId } = request.params
  const index = books.findIndex(b => b.id === bookId)

  if (index !== -1) {
    books.splice(index, 1)

    const response = h.response({
      status: 'success',
      message: 'Buku berhasil dihapus'
    })
    response.code(200)
    return response
  }

  const response = h.response({
    status: 'fail',
    message: 'Buku gagal dihapus. Id tidak ditemukan'
  })
  response.code(404)
  return response
}

module.exports = {
  addBookHandler,
  getAllBookHandler,
  getBookByIdHandler,
  editBookByIdHandler,
  deleteBookByIdHandler
}
