# BKO21: inert-anticyclotomic local units and CM arithmetic

Author: Codex. Session: codex-a71f92. Refs #1117. Date: 2026-09-21.

The published paper is completely extracted: **110 items**, comprising 6 narrowly
scoped library items, 10 existing-stage imports and 94 missing items, each routed
exactly once. This is a complete paper extraction, not a closed blueprint or a
claim that any new mathematics has been formalised.

## Source and reading boundary

The source is the [published Annals paper](https://annals.math.princeton.edu/2021/194-3/p08),
194 (2021), no. 3, 943–966, DOI 10.4007/annals.2021.194.3.8, obtained directly from
[CaltechAUTHORS](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1).
It has a JSTOR cover followed by all 24 article pages. The title, authors,
pagination and DOI agree with the publisher. Actual downloaded-byte MD5
`585fd850759cd9ea4498a2e2ff591a76` agrees with the catalogue.
SHA-256: `77ff329057e17cbad573cc309fce3f69f4ba6b73619c4ca203a4ed79a1cb790e`.
Access date: 2026-09-21.

All of §§1–6, all proofs and all 43 references were read. Printed pp.951–953,
956, 961–962 were also inspected as images. The text extractor loses
conjugation bars: the Hecke L-values involve barφ, and the Rubin interpolation
formula involves barχ and δ at χ inverse. Those are retained in the JSON.

Supporting reads, all accessed 2026-09-21:

- [Agboola–Howard II, arXiv v2](https://arxiv.org/pdf/math/0401124v2):
  all mathematical text through Theorem 5.4, including the proof of (4.2),
  Theorem 4.3 and the control arguments. SHA-256
  `8bdbebfadd90e2f1c15f9ccc7320fbd9be25f2a0e5cc3f7cba9904c832a91b14`.
- [Finis, published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p02.pdf):
  introduction, Theorem 1.1 and its correction terms, and opening §2.
  SHA-256 `878674736df503052d7b0a58504740050016a3f7dd0a0048d66cd85eb4c40f82`.
  The full theta-function/Manin–Mumford proof was not read.
- [Yu, published PDF](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf):
  §§0–4 through Proposition 3, and opening §5. SHA-256
  `ea4ddcfbbff20730a30d2db6e9d048713a0121ca959308c7d2b9c48291f6a663`.
  This includes the minimal local ring-class field with nonclosed residue field.
- [Kato 2004](https://www.numdam.org/article/AST_2004__295__117_0.pdf):
  §§15.8–15.9 including the proof of Proposition 15.9, supplementing the
  §§15.5–15.6 and §§15.13–15.18 reads from the preceding CM extraction.
  SHA-256 `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.

The prerequisites list distinguishes these reads from referenced but unread
proofs. In particular, an attempted Rubin-1987 download returned a service-shutdown
HTML page, not the paper; it supplies no mathematical evidence. Gross,
Hazewinkel, Wiles's cited proof, Rubin's two-variable proof, Arnold and the
Manin-constant input remain explicit future source/proof tasks. BKO's precise
restatements and the read AH text support the extracted interfaces. No claim of
having read those unavailable proofs is made.

## What the theorem actually says

Fix p≥5, the unramified quadratic Φ/Q_p, its integer ring O and the
Lubin–Tate parameter π=−p. The ω-part of norm-compatible local units is
Λ₂-free of rank two. Its twisted cyclotomic quotient and inverse Tate twist
give the Λ=O[[G−]] module V*.

The signed submodule V*,± kills δ_χ for the *opposite* conductor parity.
Theorem 2.1, proved again as Theorem 5.8, gives the integral equality
V*=V*,+⊕V*,−. It is a single extracted theorem with two locators, not two
targets. Corollary 2.2 gives nonzero δ_χ on every correct-sign generator.

The two inputs to the decomposition are genuinely different:

1. Section 3 constructs an optimal plus unit with unit δ-value. It uses an
   auxiliary imaginary quadratic field, a canonical Hecke character, twisted
   elliptic-unit reciprocity and Finis's inert-valuation-prime unit theorem.
2. Sections 4–5 build an optimal local-point system using a modular
   parametrization and quasi-canonical lifts of a *formal* CM elliptic curve.
   Its primitive base point and two-step trace relation give the minus
   invariant calculation and a Λ-free rank-one quotient. Nakayama then uses
   the optimal unit to generate that quotient.

This construction does not assume a locally indivisible global Heegner point.
Its geometric steps include the Manin-unit/separability input, supersingular
twist counts, fine auxiliary level and the conductor-27/32 exceptional cases.
They are not compressed into a generic “choose a point” assertion.

Section 6 defines Rubin's integral L_p through ξ=L_p v_ε. For nontrivial
χ∈Ξ^ε its interpolation is

$$
L_p(χ)=\frac{L(\bar φ\bar χ,1)}{Ω\,δ_{χ^{-1}}(v_ε)}.
$$

For a Gross Q-curve E/H with maximal CM, good inert p and p∤h_K, Theorem 6.1
identifies the opposite-sign Selmer characteristic ideal with (L_p).
Theorem 6.2 additionally assumes E is defined over K and gives the CM-component
rank/Selmer-dimension bound by ord_χ L_p, or ord_χ L_p+1 on opposite parity.

Important normalization boundaries:

- The trivial character has conductor 1 and lies in Ξ+. AH indexes parity by
  order and has the opposite sign convention.
- The π-adic Tate generator differs from Rubin's older p-adic convention by
  (−1)^n. BKO says this correction is essential to Coleman theory.
- The formal-point module A± kills the *same* parity; the unit module V*,±
  kills the opposite parity.
- The augmentation formula for ξ_ν omits l^m f, while δ_χ omits l^m p f.
  Primitive §6 values require their own Euler-factor comparison.
- Finis's split tower prime is BKO's l; Finis's valuation prime is BKO's inert p.
  This is not the ordinary Katz/Hsieh case.
- A finite geometric subgroup in Lemma 5.1(i) is Galois-stable, not pointwise
  rational. The quasi-canonical degree p^(s−1)(p+1) applies for s≥1.
- BKO writes Λ while extending the representation to R. The blueprint must
  explicitly compare Λ_R and the scalar-extended L_p; restriction of scalars
  would require a norm of characteristic ideals.
- The rank bound is on the one-dimensional CM coefficient component. Reading
  it as the full Q_p-dimension loses a factor of two. The finite-level index
  must likewise be translated from conductor exponent, not copied ambiguously.
- AH's printed E/Q, class-number-one theorem does not itself prove BKO's
  p∤h_K extension. BKO calls for the analogous argument; this remains a
  specific proof obligation.

The announced BDP formula, equality in the rank bound, full p-adic BSD,
epsilon conjecture, later p=3 results and ramified-prime theory are not
theorems of this paper and are not extracted as endpoints.

## Ownership and routes

| Route | Missing items | Scope |
| --- | ---: | --- |
| CM.4 source addition | 1 | Canonical character and Gross Q-curve specialization |
| Finite-flat Part II | 11 | Shared Lubin–Tate modules, deformation, Honda and quasi-canonical fields |
| Coleman Part II | 53 | Local-unit theorem, Kummer annihilators and optimal formal-CM points |
| Automorphic-L Part II | 12 | Early CM special values and late Rubin interpolation |
| Main-conjectures Part II | 17 | Signed Selmer arithmetic, integral equality and rank bounds |

The JSON contains the full design briefs, exact parent titles, first
prerequisites and import boundaries.

The reviewed coverage and the parents' complete documents distinguish the
existing scopes: ColemanPowerSeries is cyclotomic; AutomorphicPadicLFunctions
L3 and L3h are ordinary-CM constructions; ModularIwasawaMainConjectures L6
re-exports other anticyclotomic branches. None provides BKO by matching the
words “Coleman”, “signed” or “anticyclotomic”.

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 supplies Dieudonné theory and
nilpotent deformation, not the whole Lubin–Tate/quasi-canonical package.
ClassFieldTheory explicitly excludes the Lubin–Tate construction while still
owning the reciprocity map with which it must agree. The atlas-wide screen
also found ET.6a's Lubin–Tate towers and VB3's positive universal-cover
calculation. They must import one sufficiently general formal-module
foundation, not build private versions or become prerequisites of their own
foundations. Yu's finite-height deformation theorem is recorded with the
A₀-height convention: BKO's underlying formal Z_p-module has height two.

General modular curves, finite-flat quotients, elliptic Kummer/Selmer groups,
class fields, continuous cohomology, completed group rings and characteristic
ideals remain imports. Upstream roadmaps are not modified or re-planned.
In particular, the parametrization import is R29.5/R14.5; local finite duality
is ClassFieldTheory Layer 5, followed by R02.1's coefficient-limit comparison.

The merged but not yet reviewed PAPER-BURUNGALE-TIAN-26 proposes
CMAllPrimeMainConjectures for the general elliptic-unit and CM-main-conjecture
foundation. It is not an existing roadmap stage and is not counted as
`planned` here. Before design integration, use that accepted shared supplier
if available, or retain a precise supplier request. BKO's routes own its
normalized applications, not a second elliptic-unit library. The BT rational
cyclotomic endpoint cannot replace the integral two-variable input used by AH.

The analytic/local interaction must be staged to avoid a cycle:

$$
\text{LT foundation}\to\text{local units/Coleman/Kummer prefix}
\to\text{early elliptic-unit reciprocity},
$$
$$
\text{early reciprocity + Finis}\to\text{optimal unit}
\to\text{local decomposition}\to\text{Rubin }L_p
\to\text{signed main conjecture}.
$$

The optimal-point branch independently uses modularity and quasi-canonical
lifts and joins at local decomposition. No early analytic result may depend
on the late Rubin L-function; a blanket two-way roadmap prerequisite would
be wrong.

## Baseline and audit evidence

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Atlas snapshot `3a9e9d7877bad538bc4e0ed202e88b8bc0fef8f0` was compared to main
`4dd7f6e3f6d9fa9991ac89bb379d4c15dd82e6c1`: no mathematical atlas/document,
packet, coverage or link changes. Current WORKERS and the protocol's new
red-team section were also read.

All cited declaration statements were read at the pins. The six library
items deliberately stop at what is built: generic formal laws, the elliptic
formal law, adic elliptic formal points, Teichmüller lifts, algebraic Nakayama
and the continuous-cohomology carrier. None is called a completed Lubin–Tate,
Coleman, Selmer or Iwasawa theory. Six local source files matched their raw
pinned GitHub bytes by SHA-256:

- Mathlib formal-group Basic: `5ab5a647e27a87615315a25fbe22421ca63e3fd7eb0dbe19ceb7ba28d6a8ac9a`.
- Mathlib Nakayama: `3b51c6aadae3e2bcf21ffbceed13a83d051c247b58fe0726ead958fab0a53861`.
- Mathlib continuous-cohomology Basic: `894d44893c995096ce5b1b83f3cbe9d3e35b56b86bf0c6944fceaac36ee13110`.
- Tau Ceti Teichmuller: `4964e5ff0f74c7f93baa0c8831640e027d4a33ecfaa6f4b1b8651e08632b2b68`.
- Tau Ceti elliptic formal-group Basic: `d3d687bba9768a2ede248fca304d9c2935814636a73c9cf09243827065088d40`.
- Tau Ceti elliptic AdicPoint: `170eb4763d85f0a8658aa7e64f73543768b3070663e5e16d2f1798d93874eed4`.

Read the relevant reviewed rows for Coleman L0–L4, automorphic L3/L3h,
main-conjecture L0–L6, CM.4–CM.6, measures L1/L4/L5, Selmer L0/L2/L3,
local unramified fields and modular-curve suppliers. There is no integrated
reviewed row for the finite-flat roadmap or R29.5 in this snapshot: this is
reported as absent audit coverage, not a fabricated “not built” verdict.
Direct searches of both full pinned source trees and statement checks
supplement it. The complete upstream EllipticCurves and ClassFieldTheory
documents were read at this unchanged snapshot, with relevant ModularCurves
stages checked separately.

All 109 atlas stage edges touching the four Part II parents and all matching
link-map entries/overlaps were read. The general finite-flat/upstream-elliptic
ownership overlap is preserved as an import boundary. Existing packets and
new roadmap definitions were screened; none supplies an exact BKO signed
local-unit or inert-CM theorem.

## Blueprint acceptance requirements

The briefs require each eventual definition/construction to have its own
use-derived API, at least three tests and suggested Lean signatures. Useful
mandatory tests include:

- change of π-adic generator, and the incorrect p-adic-generator sign;
- χ=1 and one finite character of each conductor parity;
- inverse χ in δ-covariance and conjugate χ in interpolation;
- s=0 versus s=1 in quasi-canonical fields and trace relations;
- p-primitivity surviving multiplication by p+1;
- j=0/1728 fine-level cases, and stable versus pointwise-fixed torsion;
- finite flat coefficient extension versus restriction of scalars;
- correct-parity versus opposite-parity Selmer bounds, with CM rank;
- a ramified-base non-example for the unramified Honda shortcut.

The schema checker and supplemental routing/provenance checks pass. No Lean
file is required by this paper issue, none was added and none was compiled.
Independent review should especially inspect the AH extension, coefficient
dictionary, staged analytic/local dependency and the shared pending
elliptic-unit owner. These are explicit design obligations, not concealed
claims of proof closure.
