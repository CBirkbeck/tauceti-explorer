# Red team: Atobe–Kondo–Yasuda local newforms

Completed by Codex, session `codex-J6LwjP`, for issue #4244 on 2026-09-30,
against repository commit `09ca34c`. This worker did neither the extraction
nor its review. Two findings: one high, one low. Only the two assigned
red-team deliverables are changed.

The substantive finding reverses the accepted review's rejection of E3. The
extraction's counterexample to Lemma 8.10 is valid. The reviewer imposed a
generic Whittaker support condition on a degenerate induced model whose
unipotent character is trivial in the example. The other finding supplies the
protocol's missing source-version list. The extraction already records the
other source defects discussed below; they are not new findings.

## Sources and scope

Read all 56 pages of the published [Atobe–Kondo–Yasuda article](https://doi.org/10.1017/fmp.2022.17),
including proofs, examples and bibliography. The [publisher PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/div-class-title-local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field-div.pdf)
was retrieved on 2026-09-30: 879087 bytes, SHA256
`51bf4f6b80543d4c03c6e9fd68463115cd94e87fc6bf16df3f6289c087e29004`.
Printed and PDF page numbers agree. Also inspected the rendered page 47 to
verify the formal-family formula, the character convention and Lemma 8.10.
The publisher identifies the article as CC BY 4.0. Its per-download stamp
explains different historical byte hashes; that difference is not a finding.

Read the relevant parts of [Lapid–Mao, Local Rankin–Selberg integrals for Speh representations](https://doi.org/10.1112/S0010437X2000706X):
the conventions and classification discussion on printed pp.910–913, model
definitions pp.917–918, compact restriction and transition arguments
pp.922–923, and the unitary-pairing setup pp.924–925. The [publisher PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/DC32F5F3C893940A7B6E9C4DA7D44B4B/S0010437X2000706Xa.pdf/local-rankin-selberg-integrals-for-speh-representations.pdf)
was retrieved on 2026-09-30; SHA256
`afce78685f510593429179b4a49b86e6c097405f56b12bfc12b30e8fe7391535`.
This download has a publisher cover, so its PDF page 17 is printed p.923.
This was a targeted reading, not a complete rereading of Lapid–Mao or its
cited proofs. Checked the arXiv version history and searched the publisher
and web for corrections to AKY's Lemma 8.10/Theorem 9.1; no applicable public
correction was located. No claim that none exists is needed for the finding:
it concerns an identifiable error in the accepted repository review.

Read all 161 extracted item statements/statuses/locators, all 126 API contracts
and 126 proposed tests, the 19 source issues and their verdicts, all eight
routes, the four Part II briefs, the extraction's detailed counterarguments
and foundational proofs, and the independent review. The paper has 143
missing, ten planned and eight library items. All 153 nonlibrary items are
routed exactly once; the 302 recorded prerequisite edges resolve and are
acyclic. This does not certify that every possible prerequisite is recorded.
The paper checker passes unchanged.

## Finding 1 — the E3 rejection applies the wrong model (high)

**Where:** the extraction result's `sourceIssues[E3].review`, `verification`
and embedded review prose; `PAPER-ATOBE-KONDO-YASUDA-22.review.json` and
`reviews/REV-PAPER-ATOBE-KONDO-YASUDA-22.md`, especially “The rejected mistake.”
The affected consumers are `/formal-spherical`, `/spherical-collision`,
`/spherical-span`, gap G4 and the Speh-integrals Part II brief.

On published p.47 the formal function is

\[
 W^0_{\rm Ze}(ulk;\boldsymbol x)=
 \Psi^{-1}(u)\delta_{P'}^{1/2}(l)
 \prod_{i=1}^{m}W^0(l_i;x_{i,1},\ldots,x_{i,n-1}).
\]

The paper explicitly notes: “Here, we note that Ψ(u) = 1 for u ∈ U′.”
Lemma 8.10 then says that the corresponding parameter-indexed functions span
the spherical Hecke eigenspace in the indicated induced model.

Take the extraction's specialization **n=m=2**. Then `G′=GL₂(F)`,
`P′=B′`, `L′=GL₁×GL₁`, `N′=U′` and `Ψ|N′=1`. The primed
Shalika subgroup is `V′=1`, and its transition transform is the identity.
The two Whittaker factors in the displayed formula are rank-one unramified
characters. Thus, for Iwasawa coordinates

\[
g=n\operatorname{diag}(\varpi^a,\varpi^b)k,
\qquad a,b\in\mathbb Z,
\]

the family is exactly

\[
 F_{x_1,x_2}(a,b)=q^{-(a-b)/2}x_1^a x_2^b.
\]

There is **no condition a≥b**. Both integers are intrinsic to the double
coset: `b` comes from the bottom-row norm and `a+b` from the determinant.
These functions are left-`N′` invariant, smooth and right-`K′` invariant.
The lemma uses ordinary smooth induction, so compact support modulo `N′`
is not required.

Fix `x≠0` and set

\[
 F(a,b)=q^{-(a-b)/2}x^{a+b},\qquad H(a,b)=(a-b)F(a,b).
\]

Normalize Haar measure by `vol(K′)=1`. Representatives for the right cosets
of `K′ diag(ϖ,1) K′` are `[[ϖ,u],[0,1]]`, for `u∈o/p`, and
`diag(1,ϖ)`. Left-unipotent invariance gives, **for every pair of integers**,

\[
 (Tf)(a,b)=qf(a+1,b)+f(a,b+1).
\]

Consequently

\[
 TF=2\sqrt q\,xF,\qquad TH=2\sqrt q\,xH.
\]

The central operator `U`, from `diag(ϖ,ϖ)`, acts on both by `x²`, and
its inverse by `x⁻²`. Since `T,U,U⁻¹` generate the GL₂ spherical Hecke
algebra, these are the same full Hecke eigencharacter, with Satake multiset
`{x,x}`. Yet `F(1)=1`, `H(1)=0`, and
`H(diag(ϖ,1))=q⁻¹ᐟ²x≠0`. The printed spanning set at this multiset
contains only `F`; its claimed spanning assertion fails.

The review's wall argument uses the generic GL₂ Whittaker function
`s_k(x,x)=(k+1)x^k` and its vanishing for negative dominant difference.
That is not the function above. For example `H(diag(1,ϖ))=−√q x`
is allowed and supplies the term cancelling the other contribution to
`TH(1)=0`. The review's second argument also substitutes the wrong family:
`F_{xe^t,xe^{-t}}(a,b)=F(a,b)e^{t(a-b)}` is not even in `t`.
Its derivative is `H`, whereas its Hecke eigenvalues are even, exactly as
the extraction argues. Symmetry within a row of length one imposes no
symmetry between the two rows.

**Fix:** independently verify this calculation, replace E3's rejected
verdict and its erroneous justification, and make all review summaries agree.
Keep the extraction's collision counterexample, corrected spanning target
and G4; do not delete them to conform to the erroneous review. E13 may refer
to this defect with its scope stated precisely: it does not alone establish
the claimed direct-integral conclusions or disprove the main newform theorem.
Keep the all-parameter repair open until proved. No general confluent-basis
theorem is proved by this two-parameter example.

The separate collation review `REV-COL-ATOBE-KONDO-YASUDA-22` already identifies
E3's `printed` field as an editorial paraphrase rather than a literal quotation.
That is an existing collation issue, not a new finding here. Its eventual
quotation repair should use the actual p.47 text and remain separate from
the mathematical verdict above.

## Finding 2 — sourceVersions is absent (low)

**Where:** top level of `PAPER-ATOBE-KONDO-YASUDA-22.result.json`.

The extraction has 19 `sourceIssues`, including alleged errors in stated
results, but no `sourceVersions`. PROTOCOL §18 prescribes that list alongside
the findings. The source and continuation records already contain the
published version, arXiv v4, retrieval dates and hashes; the problem is the
missing standard collation record, not an absence of provenance or failure
to obtain the published article. The current paper checker does not reject it.

**Fix:** populate `sourceVersions` with the actual published and preprint
copies used, preserving their historical dates and hashes and stating the
scope of the v4 comparison. Keep the explanation about Cambridge stamps and
distinguish a byte hash from a normalized text hash. This red team's fresh
download may be added as a separately dated entry, not substituted for a
historical read. Existing collation records need no speculative re-scoping.

## Checks that did not produce additional findings

The E1 perturbation argument matches Lapid–Mao Corollary 3.13 on printed
p.923: the restriction image contains compact induction for every
m-homogeneous irreducible representation. Its `U′` is AKY's unprimed `V`;
Corollary 3.15 gives the corresponding intermediate-model statement.
For `n=m=2`, `D=V iota(GL₂)` with trivial intersection, so the compact
functions `1_(u_r K′)−1_K′`, with `u_r=1+ϖ⁻ʳE₁₂`, extend equivariantly
and lift to the model. Averaging a lift over `iota(K′)` keeps this restriction.
Every formal test is left-`N′` invariant and `det(u_r)=1`, so its two compact
integrals cancel. Distinct cosets prove linear independence. This supports
the extraction's nonuniqueness assertion, while giving no extra invariance
under the full newform subgroup. The main dimension-one theorem is not
refuted by it. The conjugation calculation producing `tb E₁₂` from `b E₃₂`
also confirms the existing character-equivariance obstruction.

The other recorded corrections match the source rereading: zero-depth
nilpotence needs its exception; the determinant-slice factor depends on the
slice degree; the polynomial generating series cannot truncate at a fixed
`n` as a global identity; the quiver/path, filtration, example and dual-vector
indices need the recorded repairs. The source's main theorem targets retain
their unresolved proof gap. Cited KZ/MW, Lapid–Mínguez and classical essential
Whittaker inputs are identified as suppliers; their unclosed proofs are not
new extraction omissions under PROTOCOL §16.

Read the actual statements and typeclass contexts of all **13 declarations**
credited by the eight library items at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Item | Declarations | Scope checked |
| --- | --- | --- |
| `/pid` | `Module.equiv_directSum_of_isTorsion` | Finite torsion module over a PID; existence, not sorted-exponent uniqueness. |
| `/radical` | `IsArtinianRing.isNilpotent_jacobson_bot` | Noncommutative Artinian ring permitted. |
| `/compact-ball` | `IsNonarchimedeanLocalField.isCompact_closedBall` | Valuation closed ball; not a matrix-group package. |
| `/weighted-grading` | `MvPolynomial.weightedHomogeneousSubmodule`, `weightedHomogeneousSubmodule_mul`, `weightedDecomposition`, `weightedGradedAlgebra` | Arbitrary variable type, additive grading, commutative coefficient semiring. |
| `/baer-extension` | `Module.Baer.extension_property`, `Module.Baer.injective` | Extension criterion; the DVR fraction-quotient specialization remains an adapter. |
| `/jacobson-criterion` | `Ideal.mem_jacobson_iff` | Left-ideal criterion over a ring, with the correct multiplication order. |
| `/nilpotent-unit` | `IsNilpotent.isUnit_add_one`, `IsNilpotent.isUnit_one_add` | Arbitrary ring; finite geometric inverse visible in the underlying proof. |
| `/nakayama-surjection` | `LinearMap.surjective_of_surjective_comp_mkQ` | Finite target and ideal contained in the Jacobson radical. |

Searched both pinned trees and the declaration index for the missing
representation and DVR assemblies. The divisible-group Baer theorem is
specifically over `ℤ`, so it does not remove the recorded general-DVR
specialization. Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`
has finite-index Mackey declarations; their statements do not provide the
smooth local-field geometric lemma. No additional library-status error was
established. These are bounded searches, not a claim of exhaustive absence.

Inspected the reviewed coverage of local-field Layer 0, AL.0/2/3 and R16.2;
the SR.0/2/3/4/5 and ET.6 descriptions; and upstream QuiverRepresentations,
InductionRestriction and LocalFieldsRamification material. The source routes
import classification, Satake, local factors and rank-two newvectors. The
four Part IIs preserve their respective finite-DVR, commuting-quiver,
Speh-integral and general-newform boundaries. The early complex derivative
and classification branches avoid importing their downstream consumers.
Cross-searches of paper inventories, roadmap/packet/link material, including
Ciubotaru–Harris, Cai–Friedberg–Kaplan, Lipnowski–Tsimerman and Schiffmann,
did not establish a duplicate owner. The doubling brief already asks for
compatibility with the Speh-integrals proposal. No candidate roadmap ID is
treated as an accepted atlas stage.

## Reproduction and validation

The following exact-arithmetic diagnostic passed **4374 assertions**. Negative
values of `a−b` are deliberately included. It supports the calculation above;
the symbolic proof establishes the assertion for all residue cardinalities
and all nonzero complex parameters.

```python
from fractions import Fraction as Q
checks = 0
for r in (2, 3):
    q = r*r
    for x in (Q(2, 3), Q(-3, 2), Q(1)):
        F = lambda a, b: Q(r)**(b-a) * x**(a+b)
        H = lambda a, b: (a-b)*F(a, b)
        for a in range(-5, 6):
            for b in range(-5, 6):
                for f in (F, H):
                    assert q*f(a+1,b)+f(a,b+1) == 2*r*x*f(a,b)
                    assert f(a+1,b+1) == x*x*f(a,b)
                    assert f(a-1,b-1) == f(a,b)/(x*x)
                    checks += 3
        assert F(0,0) == 1 and H(0,0) == 0 and H(1,0) != 0
        checks += 3
assert checks == 4374
```

Passed `check_paper.py` on the unchanged input, `check_redteam.py` on the
result, `intake.py check-files` on both deliverables, JSON parsing and
`git diff --cached --check`. No Lean file is requested or compiled. The 126
extraction tests were reviewed as mathematical specifications, not executed
as Lean tests; its historical diagnostics were not all independently rerun.
No new build, library cache or language server was started.

Input SHA256 identities:

- Extraction JSON: `581e8ad2eaa61537b815059585f670f25037a7d88b4ff8288b69b1c90e7b85ab`.
- Extraction report: `3bece4dc7b3fe9305ed0a880c8c81619680a952f8f523d8b301a19a8fcacf00b`.
- Review JSON: `f40722b07fd206e1a009bf8635b66b57ce27c182dfdc7e97d20ed7801469633c`.
- Review report: `79a779257a4d2508bf18b26e27b37555c5ec9a1812be9ba335153694377a5c91`.
