# FIX-RT-RS-21 — ownership contracts for essential lines and global expansion

Issue #5711. Codex, session `codex-rtOQ9t`, 2 October 2026.
Base: `c16f0e83ac16a9f462032c538ed664c55e513f87`.
Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`.

Both confirmed findings receive explicit ownership corrections in the proposal.
The required declaration work is routed to the existing owner blueprint jobs.
This fixes the restructuring boundary; it does **not** certify any unfinished
packet, prove the planned mathematics, or close the source gaps below.
The revised JSON is pending the independent **REV-FIX-RT-RS-21** review.
Its prior accepted review and ten corrections survive in `reviewHistory`.

| Finding | Change in the allowed deliverables | Remaining owner-blueprint work |
| --- | --- | --- |
| RT-RS-21/1 | Apply the verifier's explicit L3 alternative, with a distinct source-specific GL₂ owner, precise line-map API, coefficient/monodromy conditions and four tests; sharpen SR.5's structural export and add R16.2 → L3. | SR.5's invariant-map/duality interface and separately sourced general family scope; L3's source reconciliation, model comparison, finite-generation/freeness and invariant specialization proof. |
| RT-RS-21/2 | Assign the general GLₙ expansion to a lower AL.3 declaration component, add AF.3 → AL.3, and turn R16.5's expansion into an imported `n=2` comparison while retaining its converse theorem. | AL.3's coefficient, mirabolic reconstruction, compact-uniform convergence and noncompact dominating-estimate declarations, tests and source closure. |

## RT-RS-21/1 — the invariant line is a distinct obligation

The full finding and verifier reason were read. The verifier permits the
source-specific GL₂ minimal-lift compatibility to be L3's explicit application
obligation, because L3 already retains the Fouquet–Wan compatibility squares.
This fix uses that alternative, not a second general essential-vector theorem
inside L3. R16.2 keeps the field-valued generic GL₂ conductor/newvector theorem.
SR.5 owns the structural co-Whittaker theory and natural invariant coefficient
map. General integral essential-vector theory for GLₙ still belongs to the
canonical smooth-local family blueprint, and needs its own source-qualified
contract before being exported as a proved general theorem.

The new R16.2 → L3 link is already transitive through R16.6, R19.1, Kato L2–L3
and L3's predecessor. It makes the exact supplier visible without changing
the ordering. The existing SR.5 → L3 reason now names the invariant map and
duality boundary. No R16.2 → SR.5 edge is added: SR.5 already supplies R16.2.
No general rank-one statement is reassigned to the field-valued theorem.

### Source conditions and the unresolved coefficient boundary

Read Fouquet–Wan, *The Iwasawa Main Conjecture for universal families of modular
motives*, [arXiv:2107.13726v3](https://arxiv.org/pdf/2107.13726v3), p.5 and
Appendix A §§6.1–6.2, printed/PDF pp.74–78. Rendered pp.77–78 were inspected
to check the formulas against text extraction. Proposition 6.8 concerns an
integral co-Whittaker model and its minimal-lift specialization; Proposition
6.9 concerns conductor-level invariant lines. The source preserves the
monodromy filtration and hence uses the same conductor on both sides.

The coefficient wording on p.77 says residual characteristic zero for the
complete local domain `A`, followed by a local morphism `λ : A → O`.
The `O` of p.5 is the ring of integers of a finite extension of `Q_p`.
Those literal conditions are incompatible: `p` lies outside the maximal ideal
of `A`, so is a unit, and its image in `O` is a nonunit. This reading is not
an OCR inference. Changing residual characteristic zero to characteristic zero
would remove that contradiction, but is a **proposed reconciliation**, not a
verified correction by the authors.

For comparison, read [Emerton–Helm's author text](https://math.uchicago.edu/~emerton/pdffiles/families.pdf),
Theorem 1.2.1, Definition 4.5.9, Condition 6.1.1 and Theorems 6.2.1/6.2.5,
pp.3, 44–45 and 49–51. Its integral regime uses a reduced complete Noetherian
local ring, finite characteristic-p residue field and flatness over its Witt
ring. Minimal lift compares ranks of all powers of monodromy at characteristic
zero primes. Uniqueness is conditional on existence; the checked comparison
at a characteristic-zero point is not an integral `A → O` invariants theorem.
Notation is aligned here with coefficient prime `p` and local residue prime
`ell ≠ p`. General existence proofs and later Helm/Helm–Moss results remain
source-closure obligations of SR.5; they are not read or certified by this fix.

The intended L3 blueprint must therefore specify a compatible coefficient
regime, for example a p-torsion-free complete local `W(k)` domain `A` with
finite residue field `k`, an integral p-adic DVR `O`, and a continuous local
specialization `λ : A → O`, and verify a source or proof covering **that**
regime. This is a proposed target regime, not a claim that the printed
Proposition 6.9 already proves it. Include the actual field extension and
normalization used for LLC, semisimple Weil–Deligne data as in §6.2, existence
of the attached co-Whittaker models, unchanged monodromy ranks and unchanged
conductor. Do not use a vacuous inconsistent ring setting to declare closure.

### Map, proof order and API

Let `F` be the nonarchimedean local field, `m` the common conductor exponent,
and `U = K₁(ϖ^m) ⊆ GL₂(O_F)` the subgroup whose last row is `(0,1)` modulo
`ϖ^m`. The ring `O_F` and coefficient ring `O` are different. First reuse the
restricted representation's invariant submodule, and construct the natural
linear coefficient-change map

```
V^U ⊗_(A,λ) O → (V ⊗_(A,λ) O)^U,
v ⊗ b ↦ v ⊗ b.
```

It is a map for equivariant coefficient extension; its bijectivity is a
separate assertion. Compose it with invariants of the model-specialization
map from Proposition 6.8's proposed source-qualified construction to obtain

```
π(ρ)^U ⊗_(A,λ) O → π(ρ_λ)^U.
```

The second map's construction must precede its isomorphism theorem. A target
isomorphism, integral rank-one freeness, or invariant base change may not be
inserted as an assumed field in an artificial structure. Derivative base change
only handles derivatives. The invariant-tensor equality used in Proposition
6.9's proof must instead receive its own proof, with all coefficient, compact
subgroup and admissibility restrictions exposed. Finite generation via the
appropriate admissibility theorem, torsion-freeness, duality compatibility,
fiber calculations and any Nakayama step are separate dependencies: generic
rank one alone does not prove freeness over a local domain.

SR.5's structural API must expose restriction to `U`, the invariant inclusion,
map evaluation on pure tensors, functoriality for equivariant morphisms,
identity and composition under coefficient change, and the smooth-dual pairing
with the exact ring/admissibility hypotheses. Its map is not advertised as an
isomorphism for every base change. For instance, the sign action of `C₂` on
`Z₂` has zero invariants, whereas reduction to `F₂` makes the action trivial
and the invariant space is `F₂`; the natural map cannot be surjective. This
is a structural non-example, not a co-Whittaker minimal-lift example.

L3 must prove model-specialization compatibility, freeness of both conductor
lines and bijectivity of the composed map, then use the resulting comparison
in its existing zeta square. R16.2 supplies the field essential vector;
R16.3's WD/LLC normalization is imported through the existing prerequisite
chain. Arithmetic realization, completed cohomology and the zeta morphism
are L3's separate work, not new SR.5 constructions.

The JSON records four mandatory test specifications: identity specialization;
the unramified generic principal-series level `m=0`; the unramified Steinberg
twist whose first field newvector has `m=1`; and exclusion of a specialization
that drops monodromy or changes conductor. Tests for source-qualified integral
freeness are obligations of the future packet, not tests executed here.

**Blueprint handoff.** There is no SmoothRepresentationsOfLocalGroups or
AutomorphicCongruences packet, reader or suggested file at this base. Their
existing blueprint jobs must expand the foregoing API and proof chain into
declaration-level nodes and matching suggested signatures. SR.5 owns structural
and separately sourced general-family facts; L3 owns this qualified GL₂
application. Close the coefficient mismatch and the invariants proof before
marking that application closed. No new roadmap, unreserved live stage or
unimplemented supplier is invented by the restructuring.

## RT-RS-21/2 — one general expansion, then rank-two comparison

The general expansion now has a single owner: a lower component of AL.3,
before global Rankin–Selberg unfolding. This is a declaration component within
the existing stage, not a new atlas stage. AF.2/AF.3 supply the cusp-form
carrier, constant-term vanishing, compact unipotent integration and rapid decay;
AL.0 supplies abelian Fourier analysis and character/measure conventions.
The new AF.3 → AL.3 edge makes the first contract explicit. AL.0 already
reaches AL.3 through AL.1–AL.2. SR.5 supplies the local nonarchimedean
Whittaker theory, not an adelic reconstruction theorem.

Read [Cogdell's author PCMI notes](https://people.math.osu.edu/cogdell.1/pcmi-www.pdf),
§1.1/Theorem 1.1, printed pp.5–9 (PDF pp.9–13), and §2.2.2/Theorem 2.1,
printed pp.20–21 (PDF pp.24–25); rendered theorem and unfolding pages were
checked. For a number field `k`, `n ≥ 2`, a smooth cusp form `φ` on `GLₙ(A_k)`
with the source's growth/central normalization, and a nontrivial continuous
unitary additive character of `A_k/k`, define

```
W_φ(g) = ∫_(N_n(k) \ N_n(A_k)) φ(u g) ψ_n(u)⁻¹ du,
φ(g) = ∑_(γ ∈ N_(n−1)(k) \ GL_(n−1)(k))
        W_φ(diag(γ,1) g).
```

The coefficient uses the standard upper-unipotent character, compatible
quotient measures and compact unipotent integration. The expansion converges
absolutely and uniformly on each compact subset. Mirabolic induction supplies
its proof: Fourier expansion on the last-column abelian unipotent quotient,
vanishing of its zero coefficient by cuspidality, orbit/stabilizer indexing
by the smaller mirabolic subgroup, and repeated compact-quotient integration.
Reuse general subgroup, matrix and Fourier carriers rather than redefining
the underlying adeles or cusp forms.

The API comprises the linear coefficient map, character covariance
`W_φ(u g)=ψ_n(u) W_φ(g)`, right translation
`W_(R(h)φ)(g)=W_φ(g h)`, representative-independent coset terms, reconstruction,
compact-uniform absolute convergence and compatibility of character/measure
conventions. Any character-change isomorphism must identify its conjugating
matrix and measure change, rather than assert all choices give identical
coefficients. The `n=2` index is `k^×`, giving R16.5 its specialization.

Global unfolding additionally needs the gauge/dominating estimate cited in
Cogdell §2.2.2. Compact-uniform convergence of a series alone does not imply
an integrable bound on a noncompact quotient. The planned sum-integral
interchange therefore carries the initial sufficiently large `Re(s)` region
and a proved absolute-integrability bound on the Whittaker product. Its
proof source points to the gauge argument in reference [40], §13; that
proof interior has **not** been read in this fix and must be acquired and
decomposed by AL.3's blueprint. Rapid decay of the original cuspidal integral
does not automatically discharge domination after inserting the expansion.
Meromorphic continuation, the functional equation and Euler factorization
remain distinct AL.3 obligations, with the local uniqueness/tensor-factor
interfaces and their normalizations.

R16.5's `keeps` and `reason` now import the general expansion and retain only
its GL₂ integral-model/classical-normalization comparison and the **full
converse theorem** used in R17, with twists, pole exclusions, growth, strips
and archimedean hypotheses unchanged. Five existing supplier link reasons
containing the contrary retained-expansion claim are corrected together.
The existing AL.3 → R16.5 link is retained; no reverse link is added.

Five tests are specified in the new owner record: the `n=2` index and
comparison; right-translation compatibility; zero cusp form; the `n=3`
index `N₂(k) \ GL₂(k)` rather than `k^×`; and the separate majorant requirement
for noncompact interchange. A noncuspidal form with a nonzero constant term
does not satisfy the reconstruction theorem's cusp hypothesis. Neither a
general reductive group nor a function-field foundation is inferred from the
GLₙ number-field application.

**Blueprint handoff.** The partial AutomorphicLFunctionsAndLocalFactors packet
has AL.3 coverage `not_read`; it has no declaration nodes for this expansion.
Its job must add the coefficient map and mirabolic carriers, their APIs and
at least three tests per definition, reconstruction and compact-uniform
convergence, then the gauge/majorant theorem before global unfolding, with
matching reader and suggested signatures. This fix's allowlist does not include
that packet. The owner ledger contains the exact handoff and source locators;
AL.3 is a promised owner, not a completed producer certified by this fix.

## Evidence and validation

Read the full finding and verifier files, current proposal reader and
REV-RS-21 report, both member READMEs, the relevant complete SR.5/R16.2/R16.5,
L3/AL.3/AF.3 stage payloads, and the AL/AF owner documents. Unrelated accepted
proposal fields are preserved rather than independently re-reviewed.
Reviewed AUDIT-14 rows for R16.2, R16.5 and AL.3, and AUDIT-23 for L3,
all say their relevant representation-theoretic targets are not built.
`library-coverage.json` records their REV-AUDIT-14/23 reviews on 17 September.
There is no reviewed SR.5 row; unreviewed audit leads are not treated as proof.

At the Mathlib pin, read the actual statements in
[Invariants.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Invariants.lean):
`Representation.invariants` and `mem_invariants` supply the algebraic carrier;
`Rep.invariantsFunctor` and `invariantsAdjunction` supply its functor and right
adjunction. These do not assert arbitrary invariant coefficient base change.
The finite-group averaging construction explicitly requires invertible group
order. No new whole-library absence claim is made, and no cited baseline
declaration is rebuilt as a planned definition.

Public PDF receipts, downloaded with TLS validation and read on 2 October:

| Source/version | Pages inspected | SHA-256 |
| --- | --- | --- |
| Fouquet–Wan arXiv v3, 103 pages | 5, 74–78; images 77–78 | `39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee` |
| Emerton–Helm author PDF, 65 pages | 3, 44–45, 49–51 | `43079a450c3e053e96eae8851069a97528d5d976ce196431c5c6e61c07146289` |
| Cogdell author PCMI PDF, 85 pages | printed 5–9, 20–21; images PDF 11 and 24 | `09b82f9aed494d28327ed9692f5bf37e6bed229cf470e80927e0cc10ce70932a` |

Repository restructuring check: **ok**. Assemble the complete accepted atlas
at the base above, substitute the revised RS-21 in `build.assemble`, and
check all endpoints and edges. There are **2,956 stages**, **3,007 graph
vertices including 51 existing external endpoints**, and **8,639 → 8,641
edges**. Both full graphs are acyclic. Both new links resolve, all 175 proposal
links occur, none is skipped by integration, and applying the proposal again
does not change the edge set. This checks accepted atlas integration, not every
unaccepted concurrent research proposal or future declaration-level graph.

Scoped checks preserve the two roadmap decisions, all 23 layer IDs, all 17
narrowings, every unrelated layer record, all prior 42 owner fields, all 173
prior links, and the prior review object. Six link reasons change; two links
and two owners are added, yielding **44 owners and 175 links**. Source and test
records are attached to the two new owners; pending review never claims closure.
The reader's stale counts are updated and its old validation is explicitly
dated historical. The exact three-file allowlist, valid JSON, intake path
checks and `git diff --check` are also checked before submission.

No Lean file is requested or changed. No compiled pinned build is available;
no Lean compilation, Lake setup, cache download or library build was attempted.
