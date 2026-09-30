# PAPER-SKINNER-20 — A converse to a theorem of Gross, Zagier, and Kolyvagin

Christopher Skinner, *Annals of Mathematics* **191** (2020), 329–354,
[doi:10.4007/annals.2020.191.2.1](https://doi.org/10.4007/annals.2020.191.2.1).

The current extraction has **91 items: 31 planned and 60 missing**, with all missing items routed exactly once through eight routes. There are twelve source issues. The extraction remains complete; this is a plan and source inventory, not a formalization.

Codex — `codex-rtOQ9t`, 30 September 2026, issue [#5144](https://github.com/CBirkbeck/tauceti-explorer/issues/5144), applies all six confirmed red-team findings. The original extraction and independent review were by Claude Code, sessions `cc-7b31c4` and `cc-39fac3`, on 23 September. Their complete readings remain recorded in the JSON. This fix rereads the affected passages and the later repair; it is not another complete-paper extraction or an independent acceptance of the changes.

## What the paper proves

For a weight-two newform `f` of trivial nebentypus and squarefree level, let `A_f` be its modular abelian variety and `M_f` its totally real Hecke field. Theorem A proves that rank `A_f(Q)=[M_f:Q]` and finite Sha imply a simple zero of `L(f,s)` at `s=1`, provided an odd local component is the unramified quadratic twist of the special representation, or two odd local components are special. Theorem A′ is the semistable elliptic version, expressed through non-split or split multiplicative reduction. Theorem E has the same local alternatives and deduces analytic rank zero from finite `A_f(Q)` and Sha. Items 5 and 10 now give these full statements.

The engine is Theorem B over an imaginary quadratic field. Its hypotheses include good ordinarity, residual irreducibility and ramification, splitting of 2 and p, the specified local-component conditions, and **(e): the Bloch–Kato Selmer group is one-dimensional and injects into the semilocal group at p**. This explicit hypothesis is retained. Theorem C gives an elliptic criterion using a one-dimensional mod-p Selmer group and a local image not contained in the p-torsion image. Theorem D's positive-proportion application belongs to ArithmeticStatistics.

The proof uses parity, the general Gross–Zagier formula, the BDP/Brooks logarithm formula and Wan's Iwasawa divisibility. The group `H¹_𝔭(K,V)` is **strict at 𝔭 and relaxed at 𝔭̄**: its definition takes the kernel of restriction at 𝔭. The argument is a value/logarithm formula, not a derivative/p-adic-height formula. Its conclusion does not follow from an arbitrary nonzero cohomology class having nonzero logarithm.

## The logarithm omission has a public repair

[Burungale–Skinner–Wan, arXiv:2603.20886v2](https://arxiv.org/pdf/2603.20886v2), §1.2, explicitly identifies the omitted proof in Skinner Lemma 2.2.2. Their Theorem 1.1 says: if a number field `F⊆End⁰(A)` has a real embedding and `dim A=[F:Q]`, every non-torsion algebraic point of `A` has nonzero logarithm for every nonzero F-eigendifferential. This applies to `F=M_f` for every prime embedding. It is an unconditional rank-one result. Their higher-rank structural-rank conjecture in §5 is not used.

Items 79–81 extract the abelian p-adic analytic subgroup theorem, its endomorphism-stable variant, and the algebraic-point nonvanishing theorem. They are proposed additions to **DiophantineApproximationAndTranscendence:DT.3**, whose current logarithmic-form contract does not already contain these statements. Item 82 is the missing RM/Heegner application at **GrossZagierAndArithmeticHeights:GZ.9**. RankOneConverse imports it. Existing abelian-variety, tangent and formal-logarithm carriers are reused.

There are two distinct applications. First, finite p-primary Sha identifies the rational Selmer group with Mordell–Weil points. A non-torsion algebraic generator of the rank-one `M_f`-module has nonzero logarithm in every eigencomponent; the Kummer/logarithm comparison therefore gives injectivity on the one-dimensional λ-Selmer space. Item 20 restores all of Lemma 2.2.2. Items 5, 10, 59 and 62 no longer impose λ-uniqueness or an extra nonvanishing hypothesis on A/E. The derivative-nonvanishing input to E remains separately recorded in item 76 and E11.

Second, the Heegner tensor must be related to an actual algebraic point. Write `Q^ξ_K∈J(X)(K)⊗Q` for the rational Hodge-divisor class and `y=φ(Q^ξ_K)`. Skinner's normalized point is `P_K(f)=φ(ε_f Q^ξ_K)`. Since the differential is an f-eigenvector, functoriality gives `log_ω P_K(f)=log_ω y`. If `P_K(f)≠0`, then `y≠0`; after clearing its rational denominator, y is an actual non-torsion point. The later theorem applies to that point and proves the missing logarithm nonvanishing. This restores Corollary 2.6.2 in item 39. It does not assert nonvanishing on arbitrary coefficient-linear combinations of points. In Case I the cusp class gives the same comparison; Case II uses the Hodge class, not a cusp.

E5/E6 remain historical proof omissions with the explicit public-preprint repair. Their earlier assessments and review provenance are retained as history; their current corrections no longer weaken the statements or describe the repair as unknown. The old independent review has not been rewritten or treated as acceptance of these fixes.

## Routing and ownership

| Route | Owner | Missing items | Responsibility |
| --- | --- | ---: | --- |
| 1 | RankZeroOneBSD, Part II: **RankOneConverse** | 43 | Skinner's new converses, their Selmer/Iwasawa specialization arguments, auxiliary-field deductions, A′ assembly, and the specific Heegner normalization adapters. Reuse DESIGN-SKINNER #951 and the same candidate used by PAPER-CASTELLA-ETAL-22. |
| 2 | SelmerIwasawaCohomology **L4** | 1 | Nekovář's parity theorem; it is not analytic root-number parity alone. |
| 3 | AutomorphicGaloisRepresentations **R19.1/R19.3** | 4 | Ordinary-prime density, residual irreducibility/ramification and Serre's density input. Import level lowering and multiplicity one. |
| 4 | GrossZagierAndArithmeticHeights **GZ.9** | 3 | BDP/Brooks integrality and the imprimitive-function dictionary, plus the RM/Heegner eigenlogarithm application importing DT.3. |
| 5 | ModularIwasawaMainConjectures **L5** | 1 | The scoped rank-zero converse input inherited from the review. |
| 6 | ArithmeticStatistics **ST.4** | 1 | The positive-proportion consumer, keeping its hypotheses. |
| 7 | DiophantineApproximationAndTranscendence **DT.3** | 3 | Proposed analytic-subgroup and endomorphism-stable transcendence inputs, followed by BSW Theorem 1.1. |
| 8 | SelmerIwasawaCohomology **L1–L2** | 4 | Proposed shared elliptic Cassels–Tate pairing, divisible kernels, alternation and finite odd-primary structure. |

These are source requests and the existing Part II, not new competing roadmaps. The general duality behind route 8 remains owned by **ArithmeticGaloisDuality**. GZ.9's nonzero-cohomology warning remains valid.

**Case II geometry.** Item 68 now imports global transfer from **R17.3**. Items 87–88 separately import the indefinite canonical curve from **R18.1** and cohomology/Hecke comparisons from **R18.4**. Item 89 imports the rational modular quotient and differential realization from **GZ.3**. **R18.3 is a definite finite class set**, not the direct supplier of this curve. The CM points, rational Hodge class and denominator tracking come from **HE.1**. Only the precise Skinner–Brooks normalization comparison, item 90 and the specialized part of item 28, remains in RankOneConverse.

Skinner cites Brooks §2.8 for this normalization. The acquired [published Brooks PDF](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content) places the transfer normalization in **§2.7, p.4190**; §2.8 contains standard cohomology classes. Its introduction p.4180 also points to §2.7. E12 records this locator correction while preserving Skinner's citation. The adapter tracks the M_f-realization, differential pullback and nonzero comparison scalar; it does not assume a canonical choice or scalar one.

**A′ is an application of the converse.** Item 64 is missing and routed once to RankOneConverse. Its inputs are modularity and the modular quotient/L-function comparison from R29.5–R29.6, the actual local-component dictionary in item 63, the explicit elliptic rank/Sha-finiteness isogeny comparison in item 91, and Theorem A. Item 91 reuses EllipticCurves Layer 7 and BSD.1's existing arithmetic comparisons. R29.6 does not become a p-converse owner.

## The shared Cassels–Tate input

Items 83–86 use the [corrected Poonen–Stoll author version](https://math.mit.edu/~poonen/papers/sha.pdf), §1 p.2 and §3. This is a public exposition and generalization of Cassels' elliptic pairing and Tate's abelian-variety pairing; the original proofs were not read for this fix. The source explicitly distinguishes elliptic alternation from the more general polarized case.

For an elliptic curve over a number field, the pairing is bilinear, both kernels equal the maximal divisible subgroup, and it is alternating. These assertions do not assume Sha finite. Once the **p-primary part** is finite, its restricted pairing is perfect and alternating, so its elementary divisors occur in pairs: it is `H⊕H`. Square cardinality alone is insufficient to exclude a nonzero cyclic group of order p². The stronger structure statement is the input used in items 61/74.

Under Theorem C's hypotheses, the cofinite-type p-primary Selmer group has p-torsion `F_p`. Its finite alternative would be a nonzero cyclic group and, by the Kummer sequence, equal finite `Sha[p∞]`; the pairing excludes this. The remaining possibility is `Q_p/Z_p`. The local-image condition then gives the required injectivity. This argument never assumes global Sha finiteness before Theorem B proves it.

ArithmeticStatistics already has the gap **“Cassels–Tate pairing and its isogeny adjointness”**, needed by `ST.5/three-isogeny-selmer-parity`, and an L1 local-annihilator request. Route 8 must be coordinated with that request. These four extracted inputs do not claim to discharge its additional isogeny-adjointness theorem.

## Sources and version boundaries

The original extraction and review read the full 26-page published Skinner article and compared the 23-page arXiv v1 of 28 May 2014. The fix rereads published pp.329–331, 337–341, 343–344, 346 and 350–354. Every current Skinner statement uses the publication; the arXiv version is historical evidence, not a substitute. Source-version records distinguish these readings and the later suppliers.

The published coefficient rings matter: the p-adic L-function is in `O^ur[[Γ]]`, and the characteristic-ideal comparison is in `Λ^ur⊗_O L`. The older preprint used smaller rings. Published p.346 uses `𝓛^Σ_{f₀,K,ξ}` and Wan §7.5/Theorem 1.2; the preprint used `Σ,Hida`, §6 and an older theorem number. Items 46–47 and the prerequisite now consistently use published notation. Serre's bibliography entry is corrected to **123–201**, as in published p.353.

The source ledger retains E1 (coefficient-ring revision), E2–E4 (UFD and residual-restriction/tame-inertia slips), E5/E6 (now repaired historical logarithm omissions), E7–E10 (the prior minor formula/notation corrections), and E11 (the separate derivative-nonvanishing citation gap). E12 is the Brooks locator correction. Unchanged findings retain their prior evidence and review; no new acceptance of them is implied.

Fresh PDF provenance, all retrieved 30 September 2026:

| Source and reading extent | SHA-256 |
| --- | --- |
| Skinner published; affected passages listed above | `cfdfab6e62ac507be40d1f0bc8d9cb8371d95b42c5ae259fde054c70fb20c214` |
| BSW v2; pp.1–7, 9–11, especially Theorem 1.1, Theorem 2.3/Remark 2.4, §3 and §4.1 | `f2b4a020bf5dbcd33df3a4b30cbf27230dc0d0775312f5e543b03b2486f6a994` |
| Poonen–Stoll corrected author version; pp.1–2, §3 and bibliography selection | `3b9a619423358bc877fd2123b73a759157a728ec11e0f7b0aa48bd0333d7149a` |
| Brooks published; pp.4178, 4180, 4190–4192 | `90898527cf2e7e69bb6eba200dc7646e7f61837fa310299852ea2b958f925219` |

## Library checks and blueprint handoff

Fresh searches at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369** found no Cassels–Tate, algebraic-point eigenlogarithm or p-adic analytic-subgroup theorem. Actual pinned declarations read include Tau Ceti's `WeierstrassCurve.Affine.selmerGroup₂`, `AbelianVariety.IsIsogeny`, `AbelianVariety.TangentSpace` and `NormedSpace.logOneAddSeries`/`logOneAdd`. These are reusable carriers or explicit 2-descent, not the new odd-p Sha or transcendence theorems. The normed logarithm convergence assumptions include `ContinuousSMul ℚ≥0`, so they are not a ready-made p-adic abelian logarithm.

The reviewed DT.3 **AUDIT-07**, GZ.9 **AUDIT-25**, Selmer L1/L2 **AUDIT-27**, and EllipticCurves Layer 7 **AUDIT-11** distinguish these primitives from the missing results. No item was promoted to `library` from a name match. The actual roadmap descriptions were read before assigning each changed owner.

The authorized files do not include supplier packets. The source routes and the [fixes report](../redteam/RT-PAPER-SKINNER-20.fixes.md) give concrete handoffs to **#1027** (DT.3), **#745** (GZ.9), **#744** (GZ.3), **#988** (Selmer L1–L2), and **DESIGN-SKINNER #951**. The DT and Selmer packets are partial, GZ's existing GZ.0 packet is partial and does not yet reach these GZ.3/GZ.9 results, and RankOneConverse has no packet. No base atlas or campaign file was changed.

Validation: paper and intake checks; stable-ID and exact-once routing guards; unchanged Theorem B(e); source-version checks; selected dependency DAG and proposed DT.3→GZ.9 cycle check; finite-pairing diagnostics described in the fixes report. No Lean file is requested, generated or compiled.
