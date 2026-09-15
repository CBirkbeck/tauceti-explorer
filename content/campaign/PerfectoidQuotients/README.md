# Roadmap: perfectoid quotients and their prismatic prerequisites

This specification uses the shared [diamond conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md),
[source contracts](../../campaign-guide/DIAMONDS_SOURCE_CONTRACTS.md), and
[65-milestone source graph](../../campaign-guide/DIAMONDS_DEPENDENCY_ORDER.md). The original ECD source
coverage is retained in the 328-item index.
Canonical campaign ownership takes precedence over historical supplier paths in the source index.

The supplied ECD revision proves Theorem 5.8 by invoking Bhatt–Scholze, *Prisms and prismatic
cohomology* (BS22), Theorem 7.4 and Remark 7.5. That proof is not elementary perfectoid
algebra: BS22 §7 explicitly uses derived prismatic cohomology, the Hodge–Tate comparison
and André's flatness lemma. The general construction is now canonically expanded in
[PrismaticCohomology PR.0–2](../PrismaticCohomology/README.md); Q0–Q2 retain the
source milestone interfaces as imports below. This component owns the perfectoidization,
André and closed-quotient application, without duplicating the generic theory.

The endpoint is the closed-quotient theorem required by ECD. The chosen proof is the prismatic
proof in BS22 §§2–7; it does not require BS22's later étale comparison, Nygaard theory or
prismatic `F`-crystals. Generic enhanced categories and derived completion are supplied by
E0–E4 and do not depend on diamonds. Integral perfectoid algebra and almost mathematics
are supplied by P0–P3, with the additional algebraic criteria constructed below.

## Q0. Integral perfectoid rings, δ-rings and perfect prisms

<a id="stage-Q0:integral-algebra"></a>
### Q0:integral-algebra — The prefix supplied to prism algebra

Construct integral perfectoid rings in the scope of BS22, their relation to Tate perfectoid
rings and integral subrings, and the necessary `A_inf`/`θ` descriptions. Keep the different
notions of ordinary, derived `p`-adic and pseudouniformizer-adic completion separate. Prove
the comparison lemmas needed when passing from a semiperfectoid quotient to a Tate ring.

<a id="stage-Q0:animated-application"></a>
### Q0:animated-application — Imported prism and derived algebra

Import PR.0's constructed δ-rings, free δ-algebras, distinguished elements and prisms, boundedness, morphisms,
orientations and completed perfection. Import its proved correspondence between perfect prisms and
integral perfectoid rings, the local principal-ideal statements, and the perfection theorem
BS22 3.9. Use its required flatness and completion properties of prisms and their envelopes,
including the regular-sequence and torsion hypotheses rather than treating every ideal as
Cartier. Use existing Witt-vector constructions and compare every Frobenius lift with them.

Import simplicial commutative algebra from
[EnhancedDerivedSheaves E5](../EnhancedDerivedSheaves/README.md), and the cotangent,
derived exterior-power and completion interfaces from
[DerivedDeRhamCohomology DD.0–1](../DerivedDeRhamCohomology/README.md).
Use PR.0's comparison with its actual prism constructions. Simplicial commutative rings
and commutative algebra objects in a derived ∞-category require their actual comparison;
in characteristic `p`, do not replace them by strictly commutative DG algebras without
a theorem justifying that replacement.

## Q1. Prismatic cohomology of smooth algebras and Hodge–Tate comparison

This is the named Q1 reexport of PR.1, not a second construction. Import its relative prismatic site of a `p`-completely smooth algebra over a bounded prism,
its structure sheaf, the relevant flat coverings, Čech–Alexander models and cohomology,
including independence of presentations and Frobenius functoriality. Import the prismatic
and CR.0 divided-power envelopes and their flatness properties used in BS22 §§3–5; use the
polynomial-coordinate calculations, crystalline/de Rham comparison in the cases used there,
and their gluing and base-change compatibility.

Import PR.1's BS22 Theorem 6.3 Hodge–Tate comparison with its multiplicative map and
Breuil–Kisin twists, proved by polynomial/oriented-prism reductions and faithful-flat
descent. CrystallineCohomology CR.0–2 and DerivedDeRhamCohomology supply the prerequisite
crystalline and differential constructions; all are actual proof milestones, not assumptions.
This is the specified source closure for Q1, not a dependency on the later
étale comparison theorem of BS22.

## Q2. Derived prismatic cohomology and universal prisms

Construct universal prisms for semiperfectoid rings by the explicit adjoining, torsion-removal
and transfinite completion argument of 7.2. Apply completed perfection to obtain the universal
perfectoidization of 7.3, with its actual universal property.

Import PR.2's independent extension of the smooth-algebra prismatic functor to derived `p`-complete simplicial
commutative algebras by the coherent left Kan extension of Construction 7.6, including the
filtered Hodge–Tate comparison with graded pieces given by completed derived exterior powers
of the cotangent complex, as well as the stated base-change, colimit and descent properties.
This uses the derived-completion machinery for modules/rings, not the later prime-to-`p`
diamond coefficient theorem.

Import PR.2's proved discreteness/δ-structure and initial-object statements of 7.7–7.10, including the
idempotent-retract lemma, the regular quotient calculation and the quasiregular semiperfectoid
case. Identify the initial prism with the derived construction where the hypotheses apply.
Prove the flat-base-change compatibility needed to descend surjectivity of perfectoidization;
its universal property by itself does not automatically imply every completed base-change law.

## Q3. Quasisyntomic covers and André's flatness lemma

Import DD.0/5's quasisyntomic and quasiregular semiperfectoid conditions and cotangent
criteria. Prove the additional lifting theorem for quasisyntomic covers to bounded prisms, BS22 7.11,
and preservation of faithful flatness under the completed perfection used there. This requires
the explicit construction adjoining compatible roots and the discreteness calculation from Q2.

Prove Theorem 7.14: every integral perfectoid ring has a `p`-completely faithfully flat
perfectoid extension which is absolutely integrally closed. Construct the extension by
adjoining roots of monic polynomials, lifting to a prism, perfecting, and transfinite iteration.
Prove the completeness, perfectoidness, faithful flatness and size bounds at limit stages.
Compatible `p`-power roots of a specified element are a consequence with compatible choices,
not merely unrelated roots chosen at each degree.

The auxiliary refinements in BS22 7.12–7.15 needed by the chosen proof are included. This
stage may not use ECD v-descent or the closed-quotient theorem being proved in Q4.

## Q4. Surjectivity of perfectoidization and closed perfectoid quotients

Prove BS22 Theorem 7.4. Reduce the ideal of a semiperfectoid quotient to finitely many
generators using the correctly completed filtered-colimit argument, then to a principal ideal.
Use Q3 and the base-change/descent theorem from Q2 to pass to a faithfully flat extension
where the generator has compatible roots. Identify perfectoidization with the completed
quotient by all those roots, prove surjectivity, and descend it. Do not confuse an algebraic
quotient with its completion in this argument.

Apply Remark 7.5 to a perfectoid Tate ring `R` with plus ring `R⁺` and an ideal defining a
Zariski closed subset. Construct the semiperfectoid completed integral quotient, perfectoidize,
and invert the pseudouniformizer. Prove the universal property, surjectivity from `R`,
identification of the plus ring as the appropriate integral closure, and almost surjectivity
on integral rings. Prove that the resulting spectrum is the desired Zariski closed subset.
This yields ECD Theorem 5.8, on the same morphism and immersion carriers as P4.

## Completion and dependencies

The theorem is available independently of the v-topology and six operations. It can therefore
be used in nonnoetherian analytic geometry without creating a diamond-descent cycle. The
prismatic argument is a substantial component even though ECD cites its endpoint in one
line. Tests include a characteristic-`p` radical/perfected quotient, a mixed-characteristic
semiperfectoid quotient, independence of its presentation and the integral-plus-ring formula.

## Completion contracts added on 2026-09-15

**Applies to:** `Q0:integral-algebra`, `Q2`, `Q3`, `Q4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For the principal-ideal step adjoin a compatible root tower and prove the resulting completed quotient is the universal perfectoidization. Descend surjectivity through the p-completely faithfully flat extension using the actual completed base-change theorem, not only the universal property. For general ideals state the completed filtered-colimit passage and prove the size bound on transfinite adjoining.

### Producer–consumer contract

Q4 returns the quotient map R→S, its surjectivity, the integral-closure description of S+ and the almost-surjective integral map. It is available before v-descent. No theorem declares every underived ring quotient perfectoid.

### Acceptance and source route

Check a radical quotient in characteristic p, a mixed-characteristic semiperfectoid quotient and an ideal not already closed for the selected topology. Compare spectra and plus rings.

**Source route:** BS22 7.2–7.5/7.14; ECD 5.8 explicitly cites this route. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
