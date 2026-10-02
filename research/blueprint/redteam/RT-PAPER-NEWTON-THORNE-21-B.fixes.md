# FIX-RT-PAPER-NEWTON-THORNE-21-B

Codex, session **codex-J6LwjP**, 2026-10-02. [Issue #5533](https://github.com/CBirkbeck/tauceti-explorer/issues/5533). All six assigned independently confirmed findings are applied; the separately confirmed low-severity reader inventory finding is also reconciled. No new author erratum, independent review verdict or implementation claim is added.

## Source and library boundary

Read the relevant item/route contracts, reader, red-team result and independent verification. Targeted primary-source checks:

| Source | Current reading | SHA-256 |
| --- | --- | --- |
| [Newton–Thorne II published PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00126-4.pdf) | pp.117–118,121,131,137,146–147; rendered p.137 | `ab39986290418f835708ca5f1114b231c628ef1efe5aa7f479f2666db6ae7a1b` |
| [BLGGT14 published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf) | Lemma 1.4.3, p.533, text and rendered page | `c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b` |
| [DMW09 published PDF](https://www.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf) | Completion/reflection formula, p.1312, text and rendered page | `2117e594cb278522034646bcde9eb533139eac3ba08e23d2fc40c6f40f059d13` |

All three hashes match the red team's sources. Direct downloads worked although the web fetch of NT/DMW failed. No full-paper rereading, new preprint collation or recursive supplier audit is claimed. The original extraction/review's full reading and version comparison remain credited to those sessions. No new correction search is claimed for the four unchanged sourceIssues.

At the pinned Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**, read Tau Ceti's actual `Representation.symmetricPower`, intertwining/equivalence functoriality and `SymmetricPower.map` with identity/composition laws. Read the complex SU(2) irreducibility theorem to exclude it as a finite-field supplier. Searched both pinned trees for the defining-characteristic SL₂ result; no matching theorem found. Read the actual ArithmeticGaloisRepresentations:G7/R01.4 contracts and reviewed AUDIT-31 coverage, including algebraic-only partial symmetric-power coverage. No existing library claim was broadened beyond the added algebraic functor item.

## 1. Separate odd and dyadic support arguments

**Applied.** Item 16 now covers p>2, Proposition 2.6 and its domain R_∞≅R_loc[[X]] only. The new missing `dyadic-support-translation` item gives the actual p=2 argument and is routed once to the existing specialized Part II. It imports /20 and /60: R′_∞≅R_loc[[X]], the invariant subring of R′_∞, the Ĝ_m^γ[2]-torsor R_∞ over that subring, transitivity on components, and equivariance on P_∞/H_G,∞. Translate r′_∞ to r″_∞ on the target component and hence p′_∞ to p″_∞ in support; translate regularity and apply the unique-component argument there. The source's local dimension q+4|S∪S_∞|−1 and global component dimension q+4|S∪S_∞| are distinguished. The new item has prerequisites, API and regression cases. Route layer (4) and the reader carry the same split.

**Regression.** The squaring fibre is ℤ₂[[x]]/(x(x+2)), with distinct roots 0 and −2. The nonzero classes x and x+2 multiply to zero; their degree is below the monic relation. Thus a domain ambient ring does not make the fibre a domain. This illustrates the needed component step; it is not a proof of the patched torsor theorem.

## 2. Retain the algebraic twisting character

**Applied.** Item 41 states π₀=π⊗(χ∘det) in normalized weight k, retaining π=π₀⊗(χ⁻¹∘det) and its algebraic coefficient twist. If h is the Galois character's Hodge–Tate weight, π has weights {h,h+k−1}; {0,k−1} belongs to the normalized π₀. Its owner remains R16.6. The reader, note and proposed test record the inverse cyclotomic twist from {0,1} to {1,2}, using HT(ϵ)=−1.

**Regression.** Checked 95 exact shifts at weights 2–20 and five twisting weights. The weight difference is preserved and untwisting recovers the normalized multiset; the normalized convention is not asserted twist-invariant.

## 3. Restore the potentially crystalline guard

**Applied.** Item 59 and PolarizedAutomorphyLifting clause (iii) require potential crystallinity before the one-dimensional-graded filtration criterion, ordinary included only under that hypothesis. The crystalline Fontaine–Laffaille and potentially Barsotti–Tate branches are unchanged. The reader and proposed test exclude the split multiplicative Tate curve: its semistable monodromy is nonzero and finite-extension scaling does not kill it in characteristic zero. Merely ordinary or triangulated representations are not promoted to potentially diagonalisable ones. The actual published Lemma 1.4.3 standing hypothesis was checked on the rendered page.

## 4. Restore the DMW09 conductor factor

**Applied.** Item 45 defines Λ(s)=N_n^(s/2)γ_n(s)L(Sym^n E,s), N_n the symmetric-power conductor, with the existing geometric-Frobenius/Euler factors. The ML.3 source-route reason and reader use the same definition. N_n^(s/2)=exp((s/2)log N_n) is entire and never zero, so removing it preserves entireness; it changes the functional equation. If F=γL and Λ(s)=wΛ(n+1−s), then F(s)=w N_n^((n+1)/2−s)F(n+1−s). Exact rational exponent checks confirm this conversion. No differently normalized completion is attributed to DMW09.

## 5. Separate algebraic symmetric powers and finite-field irreducibility

**Applied.** The new **library** `algebraic-symmetric-power-functor` cites the actual pinned algebraic declarations and their precise commutative-semiring/monoid/module hypotheses. It includes pure-tensor/functorial APIs and proposed degree-zero/diagonal-weight tests. /9 and /38 import it, retaining their distinct Barsotti–Tate/pseudodeformation and automorphic-transfer conclusions. Continuity and Galois comparisons stay with G7.

The new **missing** `finite-field-symmetric-power-irreducibility` item records the direct pp.146–147 input: t is prime, 0≤m<t, and Sym^m(F̄_t²) is irreducible on SL₂(F_t). It has API/tests and is routed once through a **source addition to ArithmeticGaloisRepresentations:G7/R01.4**. The direction is owned there, but the current layer contracts do not state this precise supplier. /29 and /36 import it, keeping the separate cyclotomic-restriction and large-image hypotheses. The Part II brief names both imports. No algebraic functor is rebuilt; the complex SU(2) result is not used for the finite-field conclusion, and the prime bound is not generalized merely by replacing t with a prime-power cardinality.

**Exact regression.** Upper/lower unipotent actions on monomial symmetric tensors generate the full matrix algebra over F_p for all 17 cases p=2,3,5,7 and 0≤m<p, proving absolute irreducibility in those finite examples, including m=p−1. At degree p, the Frobenius span of e₁^p,e₂^p is a proper invariant subspace. These are finite cases, not a universal proof or a claim that all symmetric powers beyond the bound are reducible.

## 6. Correct the reader motivation

**Applied.** Replaced automatic reducibility for p≤n with the positive large-characteristic/large-image criterion and the induction's need to handle cases where irreducibility cannot be assumed. The m=p−1 boundary is explicit. Item 4's exact PSL₂/PGL₂ sandwich and strict p^a>max(5,2n−1) bound are unchanged. No unnecessary universal claim about degrees at least p is substituted.

## 7. Reconcile the confirmed inventory finding

**Applied.** Although only findings 1–6 were listed in the assigned issue, finding 7 is independently confirmed and concerns the same authorized reader. The main reader now describes the current seven routes, inventories, NT20 supplier ownership and source-version boundary. The earlier review stays as attributed history. It no longer asks another reviewer to decide ownership already accepted.

## Validation and handoff

The result has **64 items: 2 library, 30 planned, 32 missing**. Three new records are the separate dyadic proof, algebraic functor and finite-field input. Original IDs/statuses and unaffected records are unchanged. All 32 missing items occur once: 23 specialized Part II, one types Part II, five PolarizedAutomorphyLifting, and three source additions (large image, residual inertia, finite-field irreducibility). Existing endpoint source-route membership is unchanged. All 25 prerequisite works and four sourceIssue records/verdicts are unchanged. Explicit dependencies resolve and are acyclic.

Exact regressions above, `scripts/check_paper.py`, intake `check-files` for all three authorized deliverables and `git diff --check` passed. No blueprint packet, upstream roadmap or Lean source was authorized; no compilation was performed. The missing finite-field source and dyadic proof carry API/tests for their owning design jobs. General supplier proof closure and implementation remain blueprint work; all assigned confirmed findings are applied.
