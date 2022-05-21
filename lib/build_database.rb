# frozen_string_literal: true

module Library
  # Database Builder Class to Generate the Seeds
  class BuildDatabase
    def build
      build_tasks
      build_branches
      build_users
      build_employees
      build_task_values
    end

    private

    def build_tasks
      20.times do
        Task.create!(title: Faker::Lorem.question,
                     description: Faker::Lorem.sentence,
                     status: generate_random_value(%w[TODO In-Progress Pending-Approval Completed]),
                     is_completed: Faker::Boolean.boolean)
      end
    end

    def build_branches
      20.times do
        Branch.create!(name: Faker::Address.city,
                       address: Faker::Address.full_address,
                       code: Faker::Address.country_code,
                       state: Faker::Address.state)
      end
    end

    def build_users
      50.times do
        User.create!(first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     email: Faker::Internet.email,
                     is_admin: Faker::Boolean.boolean)
      end
    end

    def build_employees
      branch_ids = Branch.all

      100.times do
        Employee.create!(first_name: Faker::Name.first_name,
                         last_name: Faker::Name.last_name,
                         email: Faker::Internet.email,
                         role: Faker::Job.title,
                         job_type: Faker::Job.employment_type,
                         branches_id: generate_random_value(branch_ids).id)
      end
    end

    def build_task_values
      employees = Employee.all
      tasks = Task.all

      500.times do
        TaskValue.create!(tasks_id: generate_random_value(tasks).id,
                          employees_id: generate_random_value(employees).id,
                          comment: Faker::Lorem.sentence)
      end
    end

    def generate_random_value(array)
      array.sample
    end
  end
end
