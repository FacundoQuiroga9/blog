class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).limit(5)
  end

  def staff
    @staff_members = [
      { name: "Kyran Culhane", position: "Presidente", email: "kyran@example.com", class: "kyran" },
      { name: "Gabriel Valiente", position: "Coordinador de Futbol", email: "gabriel@example.com", class: "gabriel" },
      { name: "Ariel Argüello", position: "Marketing", email: "ariel@example.com", image: "ariel.png", class: "ariel" },
      { name: "Facundo Quiroga", position: "Webmaster", email: "facundo@example.com", image: "facundo.png", class: "facundo" },
      { name: "Santiago Salituro", position: "Social Media", email: "santiago@example.com", class: "santiago" },
      { name: "Matias Sewer", position: "Social Media", email: "matias@example.com", class: "matias" },
      { name: "Federico Estévez", position: "Social Media", email: "federico@example.com", class: "federico" }
    ]
  end


  def contact

  end
end
