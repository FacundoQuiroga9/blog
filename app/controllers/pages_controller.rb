class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).limit(5)
  end

  def staff
    @staff_members = [
      { name: "Kyran Culhane", position: "Presidente", email: "juan@example.com", class: "kyran"},
      { name: "Gabriel Valiente", position: "Coordinador de futbol", email: "juan@example.com", class: "gabriel"},
      { name: "Ariel Argüello", position: "Marketing", email: "juan@example.com", class: "ariel"},
      { name: "Facundo Quiroga", position: "Webmaster", email: "juan@example.com", class: "facundo"},
      { name: "Santiago Salituro", position: "Social media", email: "juan@example.com", class: "santiago"},
      { name: "Matias Sewer", position: "Social media", email: "juan@example.com", class: "santiago"},
      { name: "Federico Estévez", position: "Social media", email: "juan@example.com", class: "santiago"}
    ]
  end

  def contact

  end
end
