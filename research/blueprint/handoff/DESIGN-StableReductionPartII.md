# Continuation — 2026-10-02, ChatGPT Pro

Session: `gpt6astra-20261002-c84f2a`. Issue: #3342; bot-confirmed claim.
Status: **partial checkpoint, not completion and not independent review**.

This continuation preserves the 83-node packet, roadmap, reader, all source routes,
and the earlier handoff below. It adds local algebra proof notes and native
polynomial-quotient/module candidates to `suggested/StableReductionPartII.lean`.
It does not assert that any moduli stage is closed or that any Lean theorem has
been proved. The packet's existing prototype counts have deliberately not been
increased: the candidate signatures and their helper lemmas still require
packet/reader/baseline integration. In particular, the old generic explanation
that *all* omitted interfaces require geometric types is too coarse for these
local algebra clauses. The global `dual-section-ideal` node really does still
need the geometric, completion, and descent suppliers.

## Exact scope of this continuation

The focus is `MC.2/node-factorization-exact` and the
`NodeSectionFactorization.cokernels` API of `MC.2/node-matrix-factorization`.
The source is Knudsen, *A closer look at the stacks of stable pointed curves*,
arXiv:1106.1588v2 (3 April 2012), §3, printed pp. 11–12, Proposition 3.1,
with §4, printed p. 13, inspected to identify the remaining global passage.
The PDF was read as text and the three pages were also rendered and inspected.
The current download was not independently hashed; the earlier worker's source
hash below is historical, not a new hash-verification claim.

The new `NodeSectionFactorization.PolynomialModel` candidates give:

- unique monic normal forms over an arbitrary commutative base;
- injectivity of multiplication by the section's Y-coordinate difference;
- all four kernel/range equalities, including the transposed complex;
- two actual module equivalences, with formulas fixing the cokernel maps;
- a quotient-level characteristic-two example, and a non-example excluding
  arbitrary-coordinate substitutes for the quotient model.

Only native polynomial rings, `AdjoinRoot`, matrices, linear maps, ideals,
submodule quotients and linear equivalences are used. No second abstract node
ring or matrix-factorization structure is introduced. The candidates use local
notation for the explicit quotient, not an opaque carrier with assumed results.
They retain the source's noetherian/unit-discriminant hypotheses on the two
main API candidates. The elementary argument below establishes that some local
algebra statements hold more generally; that is a derivation here, not a claim
that the source printed its proposition in that greater generality.

## Local proof, with signs and dependencies exposed

Let A be a commutative ring, let γ, δ, s, t belong to A, and put
q(X,Y) = X² + γXY + δY². Work in B = A[Y][X] and set
F = q(X,Y) − q(s,t), R = B/(F). Write u and v for the images of X and Y;
coefficient images in R are implicit. Define

a = δv + δt + γu,  b = u + s + γt,  c = u − s,  d = v − t.

Then ad + bc = 0 in R, and the corresponding expression before quotienting is F.
The matrices already in the packet are

Φ = ((a,b),(-c,d)),  Ψ = ((d,-b),(c,a)).

### 1. Normal forms and regular elements

F is monic of degree two in the outer variable X. Monic division gives a
unique representative f(Y) + Xg(Y) for every class in R, with f,g in A[Y].
Consequently R is free over A[Y] with basis 1,u. This statement does not require
A to be a domain. Multiplication by F is injective in B: the top nonzero
coefficient of a nonzero polynomial survives multiplication by the monic F.
The zero ring causes no exception to injectivity.

Similarly Y−t is monic in A[Y], so multiplication by it is injective there.
In the displayed two-coefficient normal form this proves that d=v−t is a
non-zero-divisor in R. These are two different regularity facts, used at two
different steps below; neither follows merely from unit discriminant in an
arbitrary ring receiving the coordinates.

### 2. Exactness without a regular-local MCM theorem

Before quotienting, ΦΨ = ΨΦ = F I₂. Suppose a vector z in R² is killed by Φ.
Lift it to a vector z̃ in B². There is w in B² with Φz̃ = Fw. Multiplication
by Ψ gives Fz̃ = FΨw. Cancel F coordinatewise, using step 1, to obtain
z̃ = Ψw. Reduction modulo F gives z in im Ψ. The converse follows from the
product identity. Interchange Φ and Ψ for the other equality. Their transposes
also factor F I₂, so the same lifting argument proves both dual equalities.

This proves ker Φ = im Ψ, ker Ψ = im Φ, ker Φᵀ = im Ψᵀ and
ker Ψᵀ = im Φᵀ. It uses the actual hypersurface quotient and regular F;
it does not invoke the equivalence between matrix factorizations and maximal
Cohen–Macaulay modules over a regular local base.

### 3. Which cokernel is the section ideal?

Set J=(c,d). Introduce the two comparison matrices

κ = ((0,-1),(-d,b)),  λ = ((1,0),(-c,d)).

They are injective over R because their determinants are respectively −d and d,
and d is regular. Direct multiplication, before taking the quotient, gives

κΦ = ((c,-d),(-F,0)),  λΨ = ((d,-b),(0,F)).

Exactness identifies coker Ψ with im Φ. The first displayed comparison then
identifies it with J, by the formula

[z₀,z₁] ↦ cz₀ − dz₁.

Thus it is the RIGHT matrix Ψ whose cokernel is the section ideal. Abstractly
saying that the two cokernels are J and its dual, without specifying the order
and maps, loses information needed by the later expansion construction.

### 4. The other cokernel is the actual module dual

The second comparison identifies coker Φ with the ideal I=(d,b). Since d is
regular, view I/d as the fractional ideal generated by 1 and ε=b/d. The
relations εc=−a and εd=b show that multiplication by each of 1 and ε maps J
into R.

Conversely, an R-linear map h:J→R satisfies d h(j)=j h(d) for every j in J,
so it is multiplication by h(d)/d. Its possible numerators r=h(d) are exactly
those satisfying rc in dR. To compute them, reduce modulo d. There

R/dR = A[X]/((X−s)(X+s+γt)).

In A[X], X−s is monic and regular. Cancellation shows that an element
annihilating its class in this quotient is a multiple of X+s+γt. Therefore
rc in dR is equivalent to r in (d,b)=I. This proves I/d = Hom_R(J,R), with
no appeal to a substitute dual object.

It follows that coker Φ ≅ Hom_R(J,R), with [z₀,z₁] acting by multiplication
by z₀−εz₁. A denominator-free characterization, used in the Lean candidate, is

d · h_z(j) = (dz₀−bz₁)j  for every j in J.

Regularity of d proves uniqueness. On the generators it reads
h_z(c)=cz₀+az₁ and h_z(d)=dz₀−bz₁. This fixes both the sign and the
identification. As an additional check, p=((0,-1),(1,0)) satisfies
pΨ=Φᵀp and pΦ=Ψᵀp.

### 5. Local base-change consequences, not global descent

The preceding description also gives Hom_R(J,R)/R ≅ A, with the class of ε
as generator. Indeed I/dR is the ideal generated by b in R/dR; multiplication
by the monic polynomial X+s+γt identifies that ideal with A[X]/(X−s)=A.
The section evaluation R→A splits A-linearly, so J is A-flat, since R is
A-free. The exact sequence with quotient A just obtained likewise makes the
dual A-flat. Polynomial quotients and the two finite matrix presentations
commute with extension of the base coefficients A→A′. Their explicit maps
show that the resulting comparison is the natural map to the dual after base
change, rather than merely an unrelated module isomorphism.

This only establishes the explicit polynomial-model passage. It does NOT by
itself prove the global sheaf statement for an arbitrary nodal family. The
completed local normal form, faithful descent, stable reflexivity in the
source's sense and finite-presentation approximation remain to be supplied.
Do not mark `MC.2/dual-section-ideal`, arbitrary-base moduli descent or the
universal-curve theorem closed from this calculation.

## Discriminating tests and executed checks

First, in R=Z set γ=1 and δ=x=y=s=t=0. The discriminant is 1 and the two
matrix products vanish, but both matrices are zero: the kernel is Z² and the
image is zero. This rules out replacing the polynomial quotient by an
arbitrary ring with six coordinates satisfying only the product equation.
The suggested file contains this as a typed non-example.

Second, over Q impose the extra coordinate relation y²=0 and consider
R′=Q[x,y]/(x²+xy,y²), with γ=1, δ=s=t=0. Its basis is 1,y,x,xy. The two
periodic matrices still form an exact complex: x²+xy is monic in x over
Q[y]/(y²), so the cancellation proof applies. However y is now a zero-divisor,
and the cokernel-to-ideal comparison fails. The cokernel of Ψ has Q-dimension
4, whereas J=(x,y) has dimension 3. This is a quotient in a coordinate, not
an extension of the base coefficients A, so it does not contradict the
base-change statement above.

Executed exact symbolic checks with SymPy: all seven matrix polynomial
identities listed below vanish in Z[γ,δ,x,y,s,t]. These are symbolic identities,
not a finite-field sample. A separate exact rational-rank calculation checked
the second non-example. Receipt:

    PASS: seven polynomial matrix identities over Z[gamma,delta,x,y,s,t]
    PASS: Q[x,y]/(x^2+xy,y^2), ranks(phi,psi)=(4,4), dim coker(psi)=4, dim J=3

The identities are ΦΨ=FI₂, ΨΦ=FI₂, the two κ/λ comparisons above,
pΨ=Φᵀp, pΦ=Ψᵀp, and ((c,a),(d,−b))Φ=((0,F),(F,0)).
For reproducing the rational calculation, multiplication by x and y on the
ordered basis 1,y,x,xy is respectively

Mx=((0,0,0,0),(0,0,0,0),(1,0,0,0),(0,1,−1,0)),
My=((0,0,0,0),(1,0,0,0),(0,0,0,0),(0,0,1,0)).

Use block matrices Φ′=((Mx,Mx),(−Mx,My)) and Ψ′=((My,−Mx),(Mx,Mx));
both ranks are 4, both products are zero, and the rank of (Mx | My) is 3.
These checks are not Lean elaboration and not an independent review of the
mathematical proof. The full general proof is given above rather than inferred
from these tests.

## Inspected library and ownership receipts

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The following source files and relevant statements were read at that pin:

- `Mathlib/RingTheory/AdjoinRoot.lean`, lines 1–180, blob
  `1945b7728630a10baf56374f183be1bcfa3727f0`: `AdjoinRoot`, its commutative-ring
  instance, `AdjoinRoot.of`, `AdjoinRoot.mk` and `AdjoinRoot.root`.
- `Mathlib/LinearAlgebra/Matrix/ToLin.lean`, lines 1–145 and 200–350, blob
  `e27ea745bb8ab9f7766890e55c6a48e85d89a370`: `Matrix.mulVecLin`, its product
  and transpose comparisons, and the actual kernel/range usage contracts.
- `Mathlib/LinearAlgebra/Quotient/Defs.lean`, lines 1–195, blob
  `2c25d9a529dfd044d3bf88361d79a3e8de23fda3`: native submodule quotients,
  `Submodule.Quotient.mk`, quotient equality, and the scalar/module instances.

The full upstream StableReduction and JacobianChallenge reader documents were
read. Their blobs were `53c50f6e5c2ebbde46cac7720978afbf03212859` and
`aedda48979b6c3544a1dce041d00221204d64655`. Parent curve families, nodal
geometry, relative duality, contractions and scheme-level clutching remain
parent-owned; general curve Picard/Jacobian constructions remain Jacobian-owned.
No upstream roadmap was edited or replanned.

The aggregate `data/library-coverage.json` could not be read through this
connector (the large file returned no content, and the raw fallback failed).
The relevant parent inventory was instead checked against the source audit
`research/blueprint/audit/AUDIT-02.result.json` and its accepted independent
review `research/blueprint/reviews/REV-AUDIT-02.md` (16 September 2026).
This is not a claim to have reread the whole aggregate or all 519 audited
statements. Current Tau Ceti search also found a newer matrix-factorization
library; its BaseChange file was absent at the fixed Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`. No current-head search result was
silently promoted to pinned-baseline evidence.

## Resume here before promoting these candidates

1. Split the existing combined exactness/cokernel statement into individual
   proof-sized nodes without losing its ID or consumers. Add the monic-normal-
   form and regular-coordinate helpers and the precise maps above as explicit
   prerequisites/proof steps. Keep general matrix-factorization theory in its
   existing owner; these are applications to the explicit pointed-node model.
2. Integrate the four candidate signatures into the canonical export names,
   update `prototypeCoverage`, the baseline declaration records and the reader
   together, and refine the old generic omission reasons. The unchanged packet
   does not yet account for the candidate helpers/imports. Add both negative
   tests to the relevant definition/API acceptance checks; do not upgrade any
   implementation status from `unchecked`.
3. Inspect any additional polynomial/ideal declarations used for the final
   proof at the pinned commits. Elaborate only in a pre-existing built pinned
   environment, under the resource rules. These candidates have NOT compiled.
4. Read Knudsen II's Appendix and finish the completed-local/global passage;
   then continue the exact unresolved source/supplier list preserved below.

No local checkout/pinned index was available, so the standard blueprint checker
was NOT rerun in this continuation. No Lean project, build, cache or language
server was started. The earlier standard-check success below is historical,
not a validation receipt for these new candidates. Submission CI remains the
external check for the two changed allowed deliverables. The roadmap, packet
and reader retain their previous partial status and source-reading boundaries.

---

# Intake repair — codex-J6LwjP, PR #5736

The 58 genuine upstream stage references on 44 nodes are preserved in upstreamPrerequisites following the accepted Néron Part II encoding. The roadmap requires edges, requests, source/API/test/uses content, all 83 nodes and every mathematical dependency remain unchanged. No shared checker was edited and no baseline declaration was forged. Canonical prerequisite-field integration remains an explicit gap.

The standard indexed checker now passes: 0 errors, 0 warnings. All five deliverables pass intake rules and whitespace checks. A read-only actual atlas overlay restores all typed references only in memory, verifies every expected stage edge and has no pending/skipped links. Stage and combined declaration/stage graphs are acyclic. Exact receipt: {"stageDag": [3050, 8750], "combinedDag": [3098, 9121], "expectedStageEdges": 81, "typedUpstreamReferences": 58, "pendingLinks": 0, "skippedLinks": 0}. This repairs the submission format only; all source, supplier and Lean-signature gaps remain and the suggested file is still uncompiled. The earlier diagnostic checker result below is historical and has been superseded by this standard-check pass.

---

## Original checkpoint receipt (historical)

# DESIGN-StableReductionPartII — partial checkpoint

Agent: Codex. Session: codex-J6LwjP. Claim: issue3342, bot-confirmed.

This checkpoint saves a substantial draft but does **not** finish the design job.
All eight stages remain partial. Nothing is claimed implemented or independently
reviewed. Continue from the five deliverables on this branch, preserving node IDs.
The roadmap/packet and reader agree; the suggested file is explicitly incomplete.

## Saved work

83 nodes: 8 definitions,15 constructions,58 theorems,1 lemma,1 application.
72 API items,70 discriminating tests,35 planets,9 inspected baseline citations,
135 exact supplier requests and15 gaps. All21 routed Yuan/DGH items have an
explicit node mapping. The reserved `StableReductionPartII:key/moduli-curves`
is present once and covers the shared smooth/stable ordered pointed groupoid,
with universal, forgetting, clutching, dimension/properness and small-case tests.

The parent’s nodal/coherent/marked-stable/DVR interfaces are imported. The draft
does not duplicate curve cohomology, infinitesimal automorphism vanishing,
family pushouts, contractions or stable reduction. Two upstream reader documents
and the full reviewed parent audit were read; supplier descriptions were checked.

The local pointed-node module incorporates Knudsen2012’s full repair, explicit
binary form, characteristic-two-safe coordinate correction, Φ/Ψ products and
exactness. The clutching account distinguishes Ile’s known3.7 proof repair from
the3.9(b) statement counterexample. The compactification keeps S̄₀ and K(W₀),
since the stack fibre product maps finitely rather than necessarily injectively
to S×V. The Hodge account separates rank-g E from det E, rational GRR from
integral Noether, and universal sign choices from arbitrary-base units. The
Torelli account retains finite fibres, ±level ambiguity and genus-two injectivity.

## Tooling blocker

The standard `scripts/check_blueprint.py` was run with the actual pinned index.
It reports58 errors,0 warnings. Every error is the baseline regex swallowing a
valid upstream roadmap stage before stage lookup. The minimal proposed repair
is to exclude known stage IDs in that regex branch, or test stage membership
first. The report is at
https://github.com/CBirkbeck/tauceti-explorer/issues/3342#issuecomment-5950082999.
The checker is outside this job’s allowed files and was not edited. No upstream
stage was misrepresented as a library declaration. A diagnostic run excluding upstream roadmap IDs from the baseline regex reports
0 errors and0 warnings against the same pinned index; it is not a standard-check pass. The PR submission check
is expected to hit the same defect until the shared checker is repaired.

The two explicit matrix products were also checked exhaustively on64 tuples over F₂,729 over F₃ and15625 over F₅. This is computational evidence only, not a proof or Lean elaboration.

## Prototype

The suggested file was **not compiled**. The shared pinned source checkouts have
no existing built Lake environment at both commits. No project, library build,
cache download or language server was started.

The file gives actual ring/matrix definitions, six API signatures and six named
test cases, plus the polynomial correction/product theorem signatures. The packet
prototypeCoverage ledger and file comments list every omitted name. Missing
stable-family, algebraic-stack, line and Picard types prevent faithful geometric
signatures. Do not fill those names with arbitrary Prop fields or substitute
groupoids lacking the geometric conditions. Resolve supplier types first.

## Resume by layer

### StableReductionPartII:MC.0

- Resolve stable-family descent/type suppliers and supply Lean moduli-pseudofunctor signatures.
- Check literal Knudsen source excerpts and arbitrary-scheme approximation.

### StableReductionPartII:MC.1

- Read the stack valuative and algebraization arguments in DM §§2–4 at full depth.
- Resolve Hilbert/Isom/deformation suppliers and separate each nonroutine formal-to-algebraic criterion.

### StableReductionPartII:MC.2

- Read KnudsenII Appendix; finish noetherian approximation and arbitrary-base-change proof.
- Expand the rigid genus-one embedding and local collision charts into individual lemmas; supply missing Lean family types.

### StableReductionPartII:MC.3

- Verify augmented-clutching restriction using Ile; acquire a modern primary normalization reference.
- Independently review the Corollary3.9(b) counterexample; finish line/graph quotient suppliers and Lean APIs.

### StableReductionPartII:MC.4

- Read DM component/tame-cover proof and Serre rigidity sources.
- Read generic CLM positivity background and acquire/decompose the surface inputs; resolve owner extensions and all coarse-cover prerequisites.

### StableReductionPartII:MC.5

- Acquire generic integral Deligne-pairing/determinant constructions and comparison source.
- Resolve topology/Picard injection inputs and supply stack-valued line signatures; retain the rational-versus-integral distinction.

### StableReductionPartII:MC.6

- Resolve relative Jacobian, strong Torelli, all-characteristic minimal ppav compactification and Hodge supplier extensions.
- Complete formal signatures and generic finite-pullback nef/big dependencies; graph closure is specified with both the base and K(W₀).

### StableReductionPartII:MC.7

- Resolve relative Picᵈ representability and the Brauer obstruction API in the Jacobian owner extension.
- Supply actual sheaf/groupoid Lean signatures and verify each routed Yuan/DGH and key-definition consumer export.

## Exact unresolved inputs

**Parent and foundational stage imports remain open.** Every such use has a precise request naming the real supplier stage and consuming proof. Stage descriptions are specifications, not built declarations. Closure requires verified supplier nodes or pinned declarations; the parent roadmap is not replanned here.

**Curve-family Jacobians and Picard components.** JacobianChallenge layer D is over a field. Milne §8 supplies a sketch for integral-fibre projective flat families, not reducible stable families. A JacobianChallenge Part II must develop fppf relative Picᵈ, smooth relative ppav Jacobians, stable semiabelian Pic⁰, base change, canonical polarizations, Lie comparisons, and the line-lifting obstruction. Read Grothendieck FGA §232 and BLR §§8.4,9.4 at exact locators; they were not acquired here.

**Strong Torelli owner extension.** Milne §§12–13 were read in full at the scoped pages, including the theta/symmetric-power reconstruction proof. Strong Torelli, hyperelliptic sign realization, nonhyperelliptic sign exclusion and the genus-two hyperelliptic theorem need declaration-level planning in JacobianChallenge Part II. Do not duplicate those foundational proofs inside the curve-moduli owner.

**Full-level rigidity source.** Acquire and decompose Serre, Séminaire Cartan 1960/61, exposé17 Appendix, including odd-prime and level-four cases in prime-to-characteristic geometry. DM §5.14 is a citation of this result, not its proof. Oort–Steenbrink Theorem1.8/Lemma1.11 remain unacquired.

**Teichmüller and mapping-class inputs.** DM §§5.13–5.16 and Mumford1977 Lemma5.14 require connected/simply connected Teichmüller space, the analytic moduli presentation, generation by Dehn twists, boundary-loop monodromy and Sp(Z/N) surjectivity. No verified atlas owner was found. Propose an owner extension before creating these generic nodes; do not attribute them to scheme deformation theory.

**Tame normalized-level component comparison.** Read DM §§2–4 in full, especially Theorem4.19 and all normalization/tame-cover arguments used by5.9/5.13. Only §§1,5 and the stated pages were fully read. These dependencies prevent source_decomposed coverage of MC.4.

**Generic positivity and ampleness supplier extension.** SF.5 currently plans intersection/GRR and surface Riemann–Roch, not nef vector bundles. Propose SchemeAndStackFoundations Part II: curve-test nefness of locally free sheaves, quotients/extensions/symmetric powers, finite pullback/descent, classifying Grassmannian/frame maps and the precise Kollár ampleness lemma. CLM author §§2–4 (PDF6–17) remain unread; the §5 proof was read.

**Surface positivity inputs.** Acquire Mumford/Ekedahl vanishing with the characteristic-two,m=2 bound≤1, Frobenius negative-quotient contradiction, rational-double-point resolutions and pluricanonical pushforward invariance, elliptic canonical bundle formula (Bombieri–Mumford1977), and Lang1980 Euler bound. Assign generic surface facts to an owner extension; do not put them in parent StableReduction without verifying its exact scope.

**Line-valued determinants and Deligne pairing.** A generic determinant-of-cohomology/Deligne-pairing construction on proper flat nodal curves, pullback and its c₁ pushforward identity are required in addition to SF.5 rational Chow GRR. Deligne’s determinant paper and Moret-Bailly Noether1989 were not acquired. Propose a foundational/Arakelov Part II with an unmetrized algebraic core, retaining exact integral tensor powers.

**All-characteristic compactified Torelli.** KnudsenIII §6 is a characteristic-zero proof. Yuan p.56 cites an all-field minimal ppav/Hodge result. The existing C5 good-prime level scope does not alone prove the unlevel all-characteristic statement. Read Faltings–Chai V Theorem2.3 or a public primary replacement and prove compatible prime-to-characteristic level descent and boundary extension.

**Pointed noetherian-to-arbitrary-base passage.** The repaired node calculation was checked in Knudsen2012 under noetherian hypotheses. Supply finite-presentation approximation, descent and arbitrary-base-change tests to justify the moduli definition over arbitrary schemes. Read KnudsenII Appendix (PDF32–39), not yet read.

**Rigid genus-one locus and boundary normalization details.** Expand the special labelled triangle recovery into individual family lemmas and reconcile the augmented clutching proof with Ile’s nodal-locus correction. Obtain a primary modern boundary normalization statement, e.g. the consumer CLP §2.1, rather than treating Knudsen Corollary3.9(b) as a global closed immersion.

**Suggested Lean type interfaces.** The pinned libraries have schemes but no stable pointed-family, algebraic-stack, relative Picard, or invertible sheaf interfaces of the strength required here. The suggested file gives real ring/matrix signatures and explicitly lists omitted moduli signatures. All remaining APIs/tests need actual Lean types from supplier packets; arbitrary Prop fields or axioms standing for moduli objects would falsify the prototype.

**Source-locator and published-version collation.** Before full submission verify every short excerpt literally at its cited printed/PDF page, refine combined locators to individual statements, and collate the published Yuan/DGH texts. Yuan publisher PDF could not be acquired: Annals candidate404 and Euclid non-PDF response; author hash/version scope is explicit. CLM’s NSF copy repairs several older manuscript errors, but publisher identification still needs checking.

**Standard checker upstream-stage dispatch.** scripts/check_blueprint.py tests its baseline-reference regex before known stage membership and therefore rejects genuine upstream stage IDs. Reported at issue3342 comment5950082999. Only job deliverables may be edited, so the script is not patched and no baseline entries are forged. A scratch diagnostic excludes roadmap IDs from the baseline regex; it is not a standard-check pass.

## Ownership proposals

Create JacobianChallenge,Part II with relative curve Picard/Jacobian and strong Torelli stages. This packet keeps moduli-specific level and Torelli maps, importing those generic constructions after approval; no upstream edits.

Create SchemeAndStackFoundations,Part II: vector-bundle nefness/ampleness and determinant/Deligne-pairing core; use an Arakelov Part II for metric refinements. Assign surface vanishing and elliptic positivity to a verified surface owner extension.

Add a ShimuraCompactifications,Part II supplier for minimal Siegel unlevel descent across every characteristic, preserving automorphic Hodge powers. Verify a prime-to-characteristic level argument instead of claiming the good-prime scope automatically covers it.

Split MC.4 into coarse-space/projective-cover and fine-level/component sublayers once the generic positivity supplier extension is assigned; current node stage IDs are kept for this checkpoint.

## Source-reading boundary

- mumford1977: PDF63–68, printed pp.100–105: GRR calculation and Picard torsion arguments. [Source](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf); SHA-256 `558c5e1a56a522c7d6815b4def3e6410690e8e8d28642f49df6887b57905bd80`.
- milne: PDF27–30 (§8, relative integral-fibre Jacobians);PDF37–45 (§§12–13, Torelli statement and proof). [Source](https://www.jmilne.org/math/xnotes/JVs.pdf); SHA-256 `36c3f09c7462dbbd4ae1f8b81a02bd9ff84f03c5a346351d7d5d78fc3f173486`.
- dm: PDF1–14 and31–36, printed pp.75–87 and104–109;§§2–4 not read in full. [Source](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1969c--IrredModCurves-Deligne-Numdam.pdf); SHA-256 `d779973708ecef9a098db863df766f173740d75302f15655e4bbc9dd7df739e7`.
- knudsen2: §§1–3, printed pp.161–191 (PDF1–31), rendered scan. [Source](https://journals.msp.org/mscand/article/download/1622/1621/1653); SHA-256 `18e04bbf5c24a460ff10e965ebf665ea0229378c6a9521bd279909476012e230`.
- knudsen2012: Entire paper, PDF1–17; internal generated header dated 2018 is not a new arXiv version. [Source](https://arxiv.org/pdf/1106.1588v2); SHA-256 `de9f73f25a4fbe03dbe2865ebc5932412b5bf3aa7f02734c04de05013da44d36`.
- knudsen3: Entire paper, PDF1–13, rendered scan; projectivity argument is characteristic zero. [Source](https://journals.msp.org/mscand/article/download/1623/1622/1654); SHA-256 `97c2d29246b5aeff4820b4f7e74aaf8ad2e32eb72c25d05acfb7b2cbd8f017f2`.
- ile: Remark6.4 and Example6.5, PDF20–21; remaining proof not yet read. [Source](https://arxiv.org/pdf/1110.3909); SHA-256 `41e6a87de44074fdc24770e0f842c6e8846347c3b77483d17371d40c97793743`.
- clm: PDF1–5,18–33;PDF6–17 generic positivity background not yet read. [Source](https://chngr.github.io/assets/mgbar.pdf); SHA-256 `5314dd91d8957fc775ea40e30d9a9cc12159fd5b61a5f0d2640c41b18f19a829`.
- yuan-author-http: PDF16,41–46,55–57,73–75; only passages routed to this roadmap. [Source](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf); SHA-256 `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`.
- dgh: PDF6,23–24,§§1.2,6.1; only the two routed moduli items. [Source](https://arxiv.org/pdf/2001.10276v3); SHA-256 `5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4`.

The later43-page NSF CLM copy was read at PDF1–6,33,38–41 and compared with
the2021 version. SourceVersions records its hash. It repairs the older smooth
coarse-space claim, equivariant Picard argument and finite-fibres/noetherian step.
The star-direction and missing determinant slips persist in those author copies.
Ten source findings await independent review; none has a self-assigned verdict.

Missing sources include DM §§2–4 in full, KnudsenII Appendix, CLM generic
positivity background, Serre full-level rigidity, FGA family Picard construction,
BLR reducible-family Pic⁰, Mumford/Ekedahl surface vanishing, Bombieri–Mumford
and Lang genus-one positivity, Deligne determinant and Moret-Bailly integral
Noether, and Faltings–Chai all-characteristic minimal Hodge comparison. The
published Yuan PDF was not acquired; its publisher landing page was read and
the author hash is pinned. DGH’s cited Oort–Steenbrink proof was not acquired.
No whole-source reading claim is made beyond the exact scopes listed above.

Before completion: verify every literal excerpt and refine source locators,
finish backward chaining of all nonroutine steps, secure owner assignments,
write the omitted Lean signatures using real types, and rerun the standard
checker after its dispatch fix. Preserve partial status until those are done.
