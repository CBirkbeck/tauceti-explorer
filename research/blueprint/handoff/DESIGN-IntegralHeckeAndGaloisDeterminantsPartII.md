# Handoff: DESIGN-IntegralHeckeAndGaloisDeterminantsPartII

Worker: Claude Code, session cc-080cc3 (2026-10-09). Issue #3383.

## What was produced

- `research/blueprint/roadmaps/IntegralHeckeAndGaloisDeterminantsPartII.json`: the new roadmap
  "Integral Hecke actions, determinants and interpolation, Part II: ramified Hecke operators and
  local–global compatibility away from p" (area `langlands`, parent
  `IntegralHeckeAndGaloisDeterminants`), seven layers IHR.1–IHR.7 from the tame Iwahori levels of
  GL_n to ACC+ Theorem 3.1.1.
- `research/blueprint/packets/IntegralHeckeAndGaloisDeterminantsPartII.json`: status `complete`,
  43 nodes (6 definitions, 10 constructions, 26 theorems, 1 comparison), 123 API items, 70 unit
  tests, 25 planets (at most 6 per layer), 20 baseline declarations read at the pinned commits,
  18 requests, 0 gaps, 18 source issues, 3 restructure proposals. Every stage is `planned`;
  `remaining` lists name the open requests and the first lemma-level refinements.
- `research/blueprint/readmes/IntegralHeckeAndGaloisDeterminantsPartII.md`: the roadmap document,
  generated from the packet together with hand-written sections (purpose, conventions,
  boundaries, sources, layer overview), so the two agree.
- `research/blueprint/suggested/IntegralHeckeAndGaloisDeterminantsPartII.lean`.

`python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminantsPartII.json`
(with the pinned declaration index) reports 0 errors and 0 warnings;
`python3 research/blueprint/intake.py check-files` on the five files reports no problem.

## What is closed and what remains

Every one of the eighteen items routed by PAPER-ALLEN-ETAL-23 route 1 is a node (each node carries
`sourceItems`), and so are the items the unverified red team RT-PAPER-ALLEN-ETAL-23 proposes to
add to this route: the algebras T^T_R, T̃^T_R and the extended Satake map (/4), the classical-point
compatibility, the interpolation with conditions at R and the R-part of the duality step (/14),
and the existence of the auxiliary characters of Lemma 3.2.1 (/29). No stage is `closed` because
its chains end in requested stages of other roadmaps:

- SR.1 (ACC+ Lemmas 2.1.12–2.1.13 in integral form, e_U corners), SR.2 (Jacquet functors, the
  geometric lemma, Bushnell–Kutzko Theorem 7.9), SR.3 (admissibility, supercuspidal support,
  universal unramified twist);
- ET.6 (rec^T with full Weil–Deligne parameters, rec^T(St_m) = Sp_m, Langlands classification);
- TC.2 (Scholze's comparison for the full prime-to-p Hecke algebra), TC.3 (the Siegel datum and
  Proposition 2.2.16), TC.4 (ACC+ Theorems 2.3.5 and 2.3.7; RT-PAPER-ALLEN-ETAL-23/7 records that
  no stage yet states them and proposes a TC.5);
- AG2.2 and AG2.5 (ACC+ Theorem 2.3.3);
- IHG.1 (Lemma 3.2.4, Hensel's lemma for determinants), IHG.2 (Hecke images of an exact
  triangle), IHG.3 (the unramified Weil-group polynomials P_{v,σ});
- ALS.5:finite-level-duality (adjoint duality at the places of R);
- Tau Ceti ClassFieldTheory layers 7, 9, 11, 12 and Chebotarev layer 10.

Theorem 2.4.8 is imported from `PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent`.
That node's statement is built from this roadmap's operators but lists none of them as
prerequisites; the first restructure proposal records the two consistent fixes (move the theorem
here, or add this roadmap's IHR.1/IHR.3/IHR.5 nodes to its prerequisites). The second proposal
asks PA.3/PA.4's consumers of Theorem 3.1.1 to cite IHR.7 instead of AG2.5; the third concerns a
single owner for the tame Bernstein-type embedding once SmoothRepresentationsOfLocalGroupsPartII is
designed.

The first lemma-level refinements (recorded in `remaining`): the tame-level Bruhat decomposition
and quadratic relation at intermediate levels (IHR.1); the universal-unramified-twist density
argument (IHR.2, IHR.3); the root bookkeeping of Proposition 2.2.14 (IHR.4); the equivariant action
of the tame operators on the relative complexes RΓ_{K/K′}(X_{K′}) (IHR.5).

## Mistakes found in the sources (packet `sourceIssues`)

New relative to the paper extraction: E1 (t is defined on O[Ξ_v], printed on Ξ_v); E2 (ACC+
applies Flicker's Cor. 3.4, Prop. 4.11 and Th. 4.5, proved for the pro-p Iwahori over ℂ, at every
intermediate level and over O — true, by the arguments recorded in the nodes); E3 (an error: for a
unitary tame level whose torus subgroup is not block-decomposable, Ĩ_v̄ ∩ G is not a product, so
Proposition 2.2.18 needs block-decomposable levels; the paper only uses Ĩw_v̄(1,1)); E17 (the
auxiliary characters of Lemma 3.2.1 are asserted without proof; a proof by class field theory,
Kummer theory and Chebotarev is given); E18 (the remark that Proposition 3.2.2 for R = ∅ "is
Proposition 2.3.9"). E4–E16 restate, after checking them in print and in arXiv v2, the paper
extraction's E6–E11 and E24–E30.

## Suggested Lean file

The file imports individual Mathlib modules and `TauCeti.NumberTheory.HeckeRing.Associativity`
(for Tau Ceti's ring structure on Mathlib's Hecke coset modules). The local layers are prototyped:
tame levels, Ξ_v, positivity, the embedding t, t_{v,i}, e_{v,i}, ψ_{v,i}, P_{v,σ}, the Siegel levels
and transferred operators, the resultant (Mathlib's `Polynomial.resultant`) with the linear
algebra of Corollary 2.2.15, the tangent-space form of the factorization lemma, and the matrix
representation underlying E_v. The global declarations, whose carriers (Chenevier determinants,
derived Hecke images, locally symmetric spaces, Galois groups with Frobenius elements, Galois
representations of U(n, n)) are absent from the pinned libraries, are listed in the omission ledger
at the end of the file; every packet API item and unit test is either declared or listed there.

Compilation: the genuine file was NOT compiled, because the shared Lean environment at the
pinned commits has no oleans for
`TauCeti.NumberTheory.HeckeRing.*` and building them is not allowed. A variant in which that one
import is replaced by a `sorry`-stub of `HeckeCosetModule.instRingHeckeRing` with the same name and
signature (TauCeti/NumberTheory/HeckeRing/Associativity.lean:485) elaborates with `sorry` warnings
only (109 warnings, no errors), by
`lake env lean <copy of the file with the stub>` (under the swarm's compile lock, timeout 1200 s)
in that environment.

## Sources

Read on 2026-10-09 (URLs and SHA-256 in the packet): ACC+ published article (Calegari's posted
copy; title and authors checked on p. 897), arXiv:1812.09999v2 for comparison, Flicker, The tame
algebra (J. Lie Theory 21, 2011), Thorne, arXiv:2207.04925v1 (§2). Not read: Bushnell–Kutzko
(Proc. LMS 1998), Zelevinsky (Ann. ENS 1980), Bernstein's "Le centre", Chenevier (2014), Scholze
(Ann. of Math. 2015), Shin (2014), Newton–Thorne (2016): each enters only through a requested stage
or an imported node whose owner reads it.
