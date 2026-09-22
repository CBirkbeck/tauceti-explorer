# Atobe–Kondo–Yasuda (2022): extraction checkpoint

Status: **partial**. Worker: Codex, session codex-a71f92. Issue: #1395.
This is a research plan, not a formalization or an independently reviewed verdict.

The JSON contains 150 items spanning the published paper, 42 definition items
with 84 API contracts and 84 mathematical tests, eight routes, and explicit
remaining obligations. All 56 published pages, including the references, were
read. Several cited inputs still need proof-level extraction. Most importantly,
the printed essential-vector uniqueness conditions admit the concrete
common-kernel construction below. Until this is independently checked and its
downstream proof repaired, the newform proof is not certified.

The paper's main theorem is **not** disproved by finding this defect in its
auxiliary uniqueness theorem.

## Source and conventions

Primary source: [published article, DOI10.1017/fmp.2022.17](https://doi.org/10.1017/fmp.2022.17),
Forum of Mathematics, Pi10(2022),e24,1–56. Retrieved2026-09-22;
SHA256 d6cda1e641304582c9b665d0025c4c3d32081dc846e8c56c183224d74a3bbc88.
The final [arXiv version2110.09070v4](https://arxiv.org/abs/2110.09070v4),
dated2022-09-28, has60pages and SHA256
32326ab828c5cfb524cfb479e337fdd9834496cd9ec39409266c281c49883a6c.
Only targeted v4 comparisons are claimed: Lemma7.1, Lemma8.10, the
Theorem9.1 uniqueness argument, and the determinant-slice coefficients.
The v4 statements retain those issues.

F has characteristic zero, representations are smooth complex, and psi has
conductor o. Lambda_n uses ascending nonnegative tuples and lexicographic
order. The congruence group uses the depth of **row i**, not column i.
The derivative notation is an iteration of the highest derivative, not the
ordinary derivative of order i. Z(segment) is the irreducible submodule
convention; even for degree-one cuspidal data it must not be confused with
the generalized Steinberg quotient. General segment endpoints are real
with integral difference; the type-chi combinatorics uses integer endpoints.

For finite DVR modules, vee means padded coordinate addition, not direct
sum. Filtration formulas count actual submodules/filtrations, not their
isomorphism classes. The weighted counting functional is Z-linear, not a
ring homomorphism. In the analytic sections, distinguish convergent
integrals from their rational continuations, and formal spherical families
from actual tempered Speh specializations.

## What the paper aims to prove

For every irreducible pi of GL_n(F), set

    lambda_pi,k = c_(pi^(n-k)) - c_(pi^(n-k+1)),  1 <= k <= n.

The main claims are that this tuple is ascending/nonnegative, that the
K_(n,lambda_pi)-fixed space has dimension1, that lexicographically smaller
levels have no fixed vectors, and separately that levels of weight less than
c_pi have no fixed vectors. Lex and weight are genuinely different:
(0,3)<(1,1), although3>2. Existence plus weight vanishing identifies c_pi with
the least weight of a level having fixed vectors.

The source develops two largely distinct branches. Finite-DVR convexity and
the unique equality-case filtration give a Mackey formula and reduction to
unipotent and L=1 cases. The unipotent branch uses multisegment duality,
ladder determinant cancellations and a weighted polynomial argument.
The L=1 weight bound uses Hecke nilpotence and Godement–Jacquet Fourier
support. The remaining multiplicity-one branch passes through tempered
Speh models and the problematic essential-vector separation argument.

The JSON splits the two assertions of Theorem2.1, Theorem2.2, the five
parts of Lemma6.3, the three analytic assertions of Theorem8.5, the four
parts of Theorem8.11, and the support/functional-equation assertions of
Proposition9.8. Some cited multi-part inputs still need finer expansion;
this is one reason not to mark the checkpoint complete.

## A concrete obstruction to Theorem9.1 uniqueness

This is a worker argument requiring independent review. It is stated in
full so a reviewer can test the hypotheses rather than rely on a verdict.

Take n=m=2, G=GL4(F), G'=GL2(F), K'=GL2(o), and
sigma=Sp(pi,2) for an irreducible tempered pi of GL2(F).
For the primed group, the block size is n-1=1. Consequently V'=1,
the character on N' is trivial, and T' is the identity. Every formal
test function W_Sh^0(g;x)=W_Ze^0(g;x) of §8.5 is therefore left
N'-invariant for every nonzero parameter matrix x.

Choose u=[[1,varpi^-1],[0,1]] in N' but not in K' and put

    f = 1_(uK') - 1_K'.

These are distinct compact open right K'-cosets. Thus f is nonzero,
locally constant, compactly supported and right K'-invariant. Its
determinant has valuation zero on its support. For every s and x,

    integral_G' f(g) W_Sh^0(g;x) |det g|^(s-1) dg = 0.

Indeed, change variables g=uh in the first integral. Left invariance of
Haar measure, det(u)=1 and left N'-invariance of W_Sh^0 make it equal to
the second integral. These are compact-support integrals; no analytic
continuation or exchange of nonconvergent integrals is used.

In GL4, V has the four possible entries12,14,32,34, and
D=V iota(G') with trivial intersection. Hence every d∈D has a unique
factorization v iota(g). Define

    F_D(v iota(g)) = Psi(v) f(g).

This is in c-Ind_V^D(Psi). The cited
[Lapid–Mao paper](https://doi.org/10.1112/S0010437X2000706X),
Corollary3.13,p923, says that restriction of the Shalika model to D
contains this compact induction. Corollary3.15 supplies the analogous
statement in the other models. The source's row-vector convention onp918
was checked: its D is the same last-row stabilizer as AKY's, not a
transposed subgroup.

Choose a Shalika vector restricting to F_D, and average it under right
iota(K'), with Haar mass1. The averaged vector W stays in the model and
is right iota(K')-invariant. Its restriction to iota(G') is still f, so
W is nonzero. Every test integral in Theorem9.1 for W is zero.

For L(s,pi)=1, AKY's separate compact-induction argument onpp48–49 gives
at least one vector satisfying the inhomogeneous essential test conditions.
Adding W gives another. Thus the printed two conditions cannot imply
uniqueness in that case. The argument works as noninjectivity of the test
transform for any tempered pi; existence for every pi is a separate issue.

The stronger K^(c_pi)-invariance required of newforms is **not** claimed
for this perturbation. This is why a false auxiliary uniqueness claim does
not by itself disprove the main newform theorem.

### The failed step in the printed proof

In this specialization, the Hilbert subspace Pi defined onp49 is the
closure of smooth left-N'-invariant functions in L²(G'). That space is0:
a nonzero such function has infinite norm along the noncompact N'-fiber.
By contrast, Shalika restrictions contain all compactly supported smooth
functions on G' by the cited compact-induction theorem. Thus the assertion
onp50 that the restrictions being considered belong to Pi is invalid.

The character mismatch can also be seen directly. In GL4 let

    h = I + t E13,  v = I + b E32.

Then h v h^-1 = I+b E32+tb E12. Psi(v)=1 but
Psi(h v h^-1)=psi(tb), which can be nontrivial. Normalizing the
unipotent subgroup and its measure does not imply preservation of its
character. The matrix identity was checked exactly over rational numbers,
with t=1/2,b=1 as a Q2 diagnostic.

Lemma9.3 restricted to Pi is not what this example disproves: in this
specialization its premise is vacuous. Its separate spectral proof still
needs a multiplicity/domain audit. Corollary9.4 and the stated proofs of
Propositions9.5–9.6, Corollaries9.9–9.10 and general essential existence
depend on the faulty separation step and require replacement arguments.

The extraction therefore defines the **set** of essential solutions and
records the common kernel. It does not manufacture a repaired uniqueness
theorem. Nothing has been sent to the authors; that is a maintainer decision.

## Other source findings

Fourteen structured sourceIssues record the printed location, correction,
reason, reach and bounded correction search. None has a self-issued review.

The important additional issues are:

- Lemma7.1's zero-depth branch: for n=1,lambda=0, an unramified character
  sends the nonunit Hecke function1_(varpi o*) to a nonzero scalar.
  The standalone nilpotence statement is false there, and the claimed
  compact-mod-center escape fails for lambda0 in every rank. The ambient
  L=1 application can instead use a separate nonspherical-cuspidal argument;
  its conclusion is not thereby refuted.
- Lemma8.10's geometric-lemma display drops multiplicities when Satake
  parameters coincide. For the primed GL2 Borel and parameters(x,x),
  there are two equal-character Jacquet constituents, not one. This
  establishes a proof defect, not automatically a counterexample to the
  final eigenspace-spanning statement.
- In Proposition9.8, replacing s by m-s gives q^(-md)X^-d in the
  determinant-d summand, not q^-m X^-d. The support bounds survive this
  correction, but the displayed equation does not.
- The p37 generating-series denominator must be infinite, or its equality
  must be read modulo t^(n+1).
- Other slips concern truncated interval indices, a grid-path endpoint,
  vee versus+, L2 versus L1, a raw capacity tuple, D=V G' versus V'G',
  and a contragredient essential-vector label. Lemma6.6 also needs
  degree-weighted derivative orders outside its actual degree-one use.

The search checked the published article/volume listing, arXiv history and
targeted v4 text, exact-title/author correction queries, and Yasuda's official
bibliography. Atobe's linked personal page returned404 and was not read.
No AKY correction was located in this bounded search. Jacquet2012 is a
known correction to the older JPSS source, not a correction to AKY.

## Ownership and routes

| Route | Owns or supplies |
| --- | --- |
| SmoothRepresentationsOfLocalGroups, source | Smooth category, compact invariants, induction, admissibility, Satake and early complex BZ/Whittaker APIs |
| EndoscopicTransferAndUnitaryTraceComparison:ET.6, source | GL_n classification, segment conventions, Speh constructor, constituent adapters and WD comparison |
| AutomorphicLFunctionsAndLocalFactors:AL.0/2/3, source | Fourier theory and classical standard/pair local factors |
| GL2AutomorphicRepresentationsAndTransfer:R16.2, source | Existing rank-two generic newvector specialization |
| LocalFieldsPartIIFiniteLengthModules | Characteristic-free DVR class order, duality, convexity, unique actual filtrations and counting |
| QuiverRepresentationsPartIIMultisegmentDuality | Beyond upstream interval classification: opposite-degree generic duality and maximal peeling |
| AutomorphicLFunctionsPartIISpehIntegrals | Degenerate models, transforms and the analytic integral core, stopping before newforms |
| SmoothRepresentationsPartIIGeneralLinearNewforms | Row-depth levels, tuples, Mackey application and main proof assembly, with the analytic repair explicit |

The new IDs are **candidates**, not already accepted atlas stages. The
detailed briefs specify hypotheses, exact targets, prerequisite owners and
the stopping boundary. Upstream QuiverRepresentations and
InductionRestriction were read in full. The latter supplies finite-group
Mackey theory, not automatically the smooth p-adic parabolic statement.
Finite-dimensional-algebra projective covers likewise do not automatically
supply the free-cover theorem over a DVR.

The analytical extension places its group/model inputs before its integral
theorems and before newforms. The newform extension imports those outputs;
it must not make their construction depend on essential uniqueness.
ET.6's early classification branch is separate from its full LLC branch,
and SR.5's early complex derivative branch is separate from its later
integral-family dependencies.

Forty-three existing paper result route inventories were screened. In
particular, CH26's unitary/spherical candidate, HE18's Newton cocenters,
HE21/KP18's parahoric centers and FU24's locally analytic distributions
do not already own these newform targets. The candidate quiver duality must
compare with, not duplicate, general Aubert/Zelevinsky duality in that work.

## Library evidence and limits

Pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and
TauCeti f790474821cf4256814db967cb154e7af3d0c369.

Three deliberately narrow positive claims were read directly:

- Module.equiv_directSum_of_isTorsion supplies existence of primary cyclic
  decompositions over a PID, not a unique sorted DVR sequence.
- IsArtinianRing.isNilpotent_jacobson_bot works for noncommutative
  Artinian rings. It is not itself the missing nil-ideal inclusion lemma.
- IsNonarchimedeanLocalField.isCompact_closedBall supplies valuation-ball
  compactness, not the entire compact-open matrix-group API.

The relevant reviewed entries of data/library-coverage.json were read:
REV-AUDIT-04 local-fields layer0, and REV-AUDIT-14 AL.0/2/3 andR16.2.
They were compared with current blob5e708cfc74a51b10e62149113872fe4e00eb5846.
There are no reviewed SR, ET.6 or QuiverRepresentations entries in that
aggregate. AUDIT32–42 remain pending review, not accepted negative evidence.

The seven relevant owner documents were byte-compared with current main.
The atlas stages, candidate roadmap/packet/reserved-ID inventories and peer
routes were screened. Narrow terminology searches in both pinned source
trees found no Zelevinsky/Speh/Whittaker-model/newvector package. A search
failure is not a proof that no lower-level reusable declaration exists;
the remaining DVR, polynomial and nil-ideal audits are explicit gaps.

## Checks and next work

The serialized JSON is checked with the current check_paper.py and
source_issues.py, plus cross-reference, route-uniqueness, per-definition
API/test coverage and item-DAG checks. No Lean file is requested by this
paper job; no Lean compilation or proof is claimed.

A scratch exact-arithmetic diagnostic passed the GL4 conjugation identity,
the rank17 tuple(0^13,1,1,2,4), the lex/weight distinction, the missing
coefficient factor and capacity slip,4166 permutation cases for all five
Lemma6.3 subset identities up to t=6, and43 actual subgroup cases in
(Z/2)^3,Z/4×Z/2,Z/8,Z/4×Z/4 for convexity and equality-case uniqueness.
These finite tests are illustrations, not general proofs.

Resume with independent checking of E1's compact-induction hypotheses.
Then obtain a replacement analytic proof or record exactly which main
targets remain open; audit the cited KZ/MW/Lapid–Mínguez and corrected JPSS
inputs; complete library/API closure and refresh concurrent ownership.
Do not set status complete merely because the schema checker passes.

