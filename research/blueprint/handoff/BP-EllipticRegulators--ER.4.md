# BP-EllipticRegulators--ER.4 handoff

Agent: Codex, session codex-FlFWqs. Issue: #6485. This is a completed
**target-level planning pass**, not a checkpoint or a formalisation.

## Delivered

- The part packet has scope exactly EllipticRegulators:ER.4, part ER.4,
  status complete and stage coverage planned. It imports seven accepted parent
  declarations unchanged and adds 11 declarations: 8 theorems, 1 lemma and
  2 definitions, with 12 API items and 8 definition tests.
- The analytic route left open by the parent is decomposed: absolute
  convergence; L and M; the promoted M=M₁+M₂ relation; the Bernoulli horizontal
  row (Lemma 10.2.3); the logarithmic lattice evaluation (Proposition 10.3.1);
  the independent M₁ and M₂ calculations; the dilogarithmic lattice evaluation
  (Proposition 10.3.3); the raw and regularized analytic identities.
- The 4,400-word reader states the fixed conventions, all stage targets,
  accepted imports, proof sketches, API, tests, library reductions and source
  limitations. The suggested file supplies concrete coordinate expressions
  and signatures for every new declaration/API/test. It does not invent curve
  or K₂ substitute types for imported mathematics.
- Three new planets supplement the parent's three: The Bernoulli correction,
  Bloch’s logarithmic sum and Bloch’s dilogarithmic sum. The total is six.
- Twelve Mathlib declarations were checked by reading their actual statements
  at 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti was searched at
  f790474821cf4256814db967cb154e7af3d0c369. No regulator/direct Fourier targets
  already present were planned again.

## Checks

The suggested file elaborated using lean-check against the shared, pinned
Mathlib build, with only the expected declaration-uses-sorry warnings and no
errors. The shared Tau Ceti checkout is newer than the recorded pin, but this
file imports only Mathlib; its check therefore uses no newer Tau Ceti input.
No library build, cache download, Lake update or language server was started.

The packet checker reports zero errors and zero warnings. The API and test
names were checked against the suggested file, and the patch contains only
this issue's four deliverables. Implementation status remains unchecked.

Independent numerical diagnostics at 35-digit working precision used C=3,
τ=0.1+1.1i and f=(1+2i)(δ_(1,0)−δ_(2,0)). Twenty-five direct q-orbit terms
agree with the csc² evaluation of L within 2×10⁻³⁴. For M, a raw m cutoff at
±1200 has error about 1.7×10⁻⁷; removing its polynomial tail using the trigamma
residue formula for H and summing the cotangent remainder through ±35 gives
agreement within 4×10⁻³⁶. The M₁=H+M and M₂=−H comparisons agree within
5×10⁻³⁶. The separate f=δ_(0,1)−δ_(0,2) test checks
B=8π²iy²/(81√3). These diagnostics are normalization checks, not proofs.
The reader contains the formulas and values needed to reproduce them; no
scratch dependency is needed by the next worker.

## Confirmed red-team finding

RT-AREA-combinatorics/14 is handled by the explicit AC.0→ER.4 link and the
ownership proposal. No generic Fourier transform, inversion, Parseval or
convolution is replanned. ER.4 retains the parent's C-torsion adapter and odd
identities. The supplier nodes are AdditiveCombinatorics:AC.0/fourier-transform,
/fourier-parseval and /fourier-nconv. The current AC.0 packet already specifies
the averaged convention, ZMod.dft and haarProb comparisons.

The missing column-orthogonality audit evidence was verified at the Tau Ceti
pin: CommGroup.sum_monoidHom_apply_eq_ite in
TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104. For finite
commutative G and a domain M with enough roots of unity for exponent G, the
sum over characters G→Mˣ evaluated at g equals card G at g=1 and zero otherwise.
This evidence is in the packet's upstreamNotes for the AC.0 audit owner.
That owner must add the citation and retain explicit compatibility with the
existing AlgebraicCodingTheory Layer 3 and ModularForms Layer 0 interfaces.
This job is forbidden to edit those supplier/upstream files and does not
rebuild their mathematics. There are no new requests to other roadmaps.

## Precise remaining work and assembly

The parent direct-analytic gap is supplied by this part. Assembly must wire
EllipticRegulators:ER.4/direct-regularized-fourier-identity into the parent
ER.3/fourier-and-kronecker-eisenstein torsion expansion and
ER.4/bloch-theorem-10-2-1, retaining their identifiers. The order is analysis,
then divisor/class interpretation, then C³ scaling. The direct proof must not
acquire a prerequisite on the parent Fourier expansion, divisor formula or
class regulators; that would recreate a circular route. Brunault's Theorem 21
also cannot be its premise, since it invokes Bloch's final theorem.

The one retained gap belongs to the supplier
EllipticRegulators:ER.7/regulator-under-finite-pushforward: prove
r_Y(N_φξ)(ω)=r_X(ξ)(φ*ω) for every ξ∈K₂(ℂ(X)) and a finite morphism φ:X→Y.
A projection formula only on {F,φ*G} does not prove that those symbols generate
all classes. The accepted ER.4 constant-field trace is already supplied by
split base change and additivity and does not require this stronger theorem.
Assembly must retain this gap; ER.7's owner must resolve it. No part of this
handoff asks a worker to implement proofs in this planning programme.

## Sources and limitation

Read Bloch, CRM Monograph Series 11 (2000), Lecture 10 §§10.2–10.3,
printed pp.77–85, on 2026-10-06. Barred denominators and Im placement were
reconstructed by algebra and the numerical checks; reviewers should collate
them with the printed pages.

Read Brunault's thesis, arXiv math/0602186v1, §1.2, printed pp.20–28. Its
PDF SHA-256 is 8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7.
Read the Tau Ceti EllipticCurves and ModularForms roadmap documents for scope
and density, and the reviewed ER.4 library audit before planning.

Source issue EllipticRegulators/ER4-E1 records the public text's strict
unit-disc assertion before (10.3.2). Equality occurs at ℓ=n=0; the log-weighted
summand is zero, while the unit-circle Li₂ summand survives. The correction
affects a proof justification, not the final result. The finding is expressly
scoped to the accessible digitization; published errata searches and the
author publications page checked on 2026-10-06 found no matching correction.
The parent's capital-C typo EllipticRegulators/E11 is inherited without a
new duplicate entry.
