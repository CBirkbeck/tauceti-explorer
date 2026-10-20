# FIX-PKG-LogicAndDefinabilityInNumberTheory~adv

Completed by Claude (Opus 5.5), session `claude-bkwOej`, 2026-10-20. Refs #11514.

The bot confirmed this session's claim. This is a complete package fix, not a checkpoint. Only the four
issue deliverables changed: the package README, Suggested.lean and review.json, and this handoff.
The findings are those of the independent package review (`research/blueprint/reviews/REV-PKG-LogicAndDefinabilityInNumberTheory.md`, Codex, issue #10904);
no `REV-PKG-…~adv.md` file exists, so that report was used. No packet, reader, consumer or
upstream file was edited.

## Finding → change

| Finding | Disposition |
| --- | --- |
| §6.15: the all-width rough-curve repair of BKT Lemma 4.5 and its Hodge consumer were not established. | §6.15 is now the theorem `roughCurveTest` with a complete six-step proof: clearing to a Laurent polynomial on each width, removal of q₁ with a uniform exponential error, nonpositivity of y₁-powers, the substitution z₁=mz₂+c (which maps admissible curves of width R′ to admissible curves of width mR′+c), the r-th finite difference in c and the Descartes–Vandermonde inversion, and descent in the x₁-degree. The induction is over all widths; the substitution leaves width one for m≥2, which is why the printed width-one argument is incomplete. Checks: width escape (m=2, x₂=3/4), h=(x₁−2)²+y₁⁻² in S₁∖S₃, an unbounded positive power, a 2×2 Vandermonde. The consumer verification (CKS/Kashiwara norm estimates on every bounded real interval via unipotent monodromy translation; Schmid along the punctured disc u↦(c_iu^(a_i)) for every admissible curve) is written out and assigned downstream to HodgeStructuresPartII, which owns the Hodge objects. |
| §6.29/§6.36: the marked endpoint after analytic rescaling. | Not needed. HP Corollary 7.2(iii) gives a point σ∈Σ with π₂σ=π₂β(0). In the torus lemma, y(0)=γ₀x−a₀ for that σ with γ₀∈Γ, Ax-type gives exp(y(0))+G′⊆X, and γ₀X=X gives exp(x)+γ₀⁻¹G′⊆X. Gao–Habegger's "γ(0)∈Γ" step (p.20) is replaced by this existential form. §6.29 explains why β(0) itself moves, with the example Σ={(0,0),(1,1/2)}, β(s)=(s,max(0,s−1/2)). The torus lemma (GH Lemma 5.2) is new §6.31 with the definition `AxType` and four Checks; it needs no external input. |
| Part II / period-map / mixed / A_g arithmetic suppliers have no stages; whole-layer citations would cycle. | The application suffix is a new Layer 7 whose theorems carry their inputs as explicit hypotheses: `AgAndreOortInput g` (§7.1: (I-def) Peterzil–Starchenko and Pila–Tsimerman 2014 Thm 4.4; (I-ws) PT §2 and Lemmas 7.2–7.6; (I-AL) PT Thm 6.1; (I-orbit) Tsimerman Thm 5.2; (I-lift) PT 2013 Thm 3.1), `ProductLocusInput` (§7.5), (I-Ax) (§7.6), (I-BT) (§7.7), `MixedAndreOortInput S` (§7.8, Gao Thms 1.2, 12.2, 13.3, Rem 4.4, §10.1). §§7.2–7.4 follow PT Theorem 7.1's proof (induction stays in A_g); §7.8 is Gao Theorem 13.6 in its abelian-type generality. No Layer 7 hypothesis contains its conclusion. No citation of LogicAndDefinabilityPartII, PeriodMapsAndPeriodDomains Part II or a mixed ShimuraVarietiesPartII remains. |
| SF.1 chart contract (closed embeddings, embedding independence, overlap descent). | SF.1 is the atlas id of descent and stacks, not charts. Charts, closed immersions, fibre products, smooth morphisms and Kähler differentials are now cited from Mathlib (names checked at 082e2d3), dimension from upstream SchemeAndStackFoundations §0.7, top differentials from §2.20. §3.1 now contains the closed-embedding globalization of motivic integration: closed embeddings of affine charts, independence by CL Lemma 15.1.1 (isomorphism invariance), overlaps affine by separatedness, finite subordinate partitions; CL's p.83 open-coordinate claim fails for y²=x³−x. §2.7 builds the F-analytic manifold of points of a smooth variety from closed embeddings and Schneider's Proposition 6.4. |
| R11.2 general dual prime-to-p isogeny contract. | Upstream Néron (PR #852) §§2.5, 4.6 are semistable only. New §2.10a `dualNeronPointCount`: BLR §7.3 Proposition 6 (p.180) for the étale extension, Lang plus #H¹(k,K)=#K(k) for identity components, Lorenzini Proposition 4.3 (pp.2032–2033, via McCallum) for #Φ_A(k)=#Φ_{A^∨}(k). Four Checks (good reduction, Tate curve, cyclic-group identity vs Lorenzini Example 4.4, wild isogeny). §2.11's proof now uses it. |
| MC.1/MC.4: residue-scissor realization and denominators. | §3.11 constructs `residueMotivicRealization` into M_loc, the localization of TriangulatedK0(DM_gm(k,ℚ)) at [ℚ(1)] and 1−[ℚ(−i)], as theory change (CL Prop. 16.1.1, p.88), Chevalley constructibility (CL §16.2), γ (CL §16.3, p.89) and χ^c of upstream Motives §4.20 (PR #1313), with χ^c(𝕃)=[ℚ(1)]. Invertibility holds by construction; no injectivity is claimed. |
| RP.2 does not give the CTV theorem; abstract Hilbert symbols do not give trace/dyadic data. | New §4.29a `normicZeroCycles` (CTV Prop 2.2, Thm 3.1, Cor 3.2, Prop 3.4, Lemma 4.1, Prop 4.2 with pages) consuming Heights §§2.16b, 2.17, 2.20, 2.21 (PR #1017), Resolution §6.2 (PR #1199), WeilConjectures curve RH (PR #1208), Chebotarev and ClassFieldTheory. §4.30's proof now follows CTV Theorem 4.3 step by step. The quadratic-form contract pins QFI §6C items 9, 10, 12 and GQF §§4.1–4.4, 5.5, 6.1; the local trace ranges stay in §4.21. |
| Remaining proof-source requirements. | Resolved: arbitrary-rank henselization (Stacks 04GN, 04GS, 0ASK); parametric rectilinearization (Cluckers 2003 Thm 3, pp.6–7); local-field substitution and inverse function theorem (Schneider Prop. 6.4 with a short ultrametric ball argument); global motivic descent (above); R_an,exp o-minimality, cells and dimension consumed from upstream ShimuraVarieties §3.5a (PR #933), R_an and R_exp as reducts; definable Chow consumed from §3.5d, singular ambient reduced to an open subset of projective space; PS Theorems 3.2, 4.1, 4.4 with pages. Remaining, explicitly marked **Gap.**: the globally subanalytic comparison and analytic cells for R_an,exp (§6.3, original papers unread), general o-minimal cells (§6.4) and dimension/choice/triangulation (§6.5) for arbitrary expansions, and the general proper quotient (§6.9) — all proved in van den Dries's *Tame topology*, which is neither free nor cleared. |

Other changes: the Hermitian structure comparison (old §6.35) is upstream ShimuraVarieties §3.6 and was removed as a duplicate (listed under Scope and ownership). DT.0 citations now point to upstream DiophantineApproximationAndTranscendence §§0.1–0.3. The ArcTopology non-dependency bullet was removed. Process language ("proof-source requirement", "requested", "must be supplied", "LD.n") and shorthand source keys were replaced. Suggested.lean changed only in its layer comments; its 13 declarations are unchanged.

Target inventory: 127 input anchors → 130. Added `ld2-dual-neron-counts`, `ld4-normic-zero-cycles`, `ld6-ax-type-torus-lemma`; removed `ld6-hermitian-structure-comparison`; renamed the seven remaining suffix anchors from `ld6-…` to `ld7-…` (`finite-exceptional-cm`, `special-family-induction`, `andre-oort-ag`, `cm-pairs`, `abelian-group-action`, `period-codimension`, `mixed-andre-oort`) and added `ld7-andre-oort-input`. No Check or hypothesis was dropped.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result / change |
| --- | --- | --- |
| §2.10a Néron counts | good reduction (Φ=0); split Tate curve ord Δ=n (#𝒜(k)=n(q−1)); Frobenius −1 on ℤ/3; S₃ on (𝔽₃)³/diag; degree-p isogeny with supersingular reduction | all consistent; prime-to-p and finite-k hypotheses shown necessary by the last two |
| §2.11 dual volume | ω=0; ω scaled by F× | both sides scale alike; unchanged |
| §3.1 globalization | affine elliptic curve; U∩U′ for a separated variety; two embeddings of 𝔸¹ | open-chart reduction false, closed-embedding argument valid |
| §3.11 realization | 𝔸¹-homotopy motives (𝕃↦1 kills 1−𝕃⁻¹); 𝔾_m; ℙ¹; odd shift sign | localized target required; values [ℚ(1)]−1, 1+[ℚ(1)] |
| §4.29a/§4.30 | K split; p=2 (Poonen); a degree-p point with the degree-(2p+1) point; r=1 | Br X=Br k when split; gcd(p,2p+1)=1 gives degree 1; r=1 separate |
| §1.11 henselization | trivial valuation; rank two; ℚ at p vs ℚ_p | identity, no rank hypothesis, completion not algebraic |
| §6.3 | ℤ⊂ℝ; reducts | ℤ not definable; reducts o-minimal |
| §6.15 curve test | n=1; R=1 with m=2; h∈S₁∖S₃; P=y₁; exponents {0,−1} | all-width hypothesis necessary; Checks added |
| §6.17/§6.18 | nodal cubic ambient; graph of exp | open-subset-of-ℙⁿ reduction; definability needed |
| §6.29/§6.31 | Σ={(0,0),(1,1/2)}; finite X; subtorus; parabola image; generators [[1,2],[0,1]],[[1,0],[2,1]] and inverses | existential endpoint suffices; c must bound inverses |
| §7.1 | g=1 reduced form; class number; π on all of ℋ_g; CM vs non-CM points of A₁ | k₁=2, a₁=1; any b₁>2; definability only on fundamental sets; special-point clause necessary |
| §7.2–§7.4 | V a point; V=A_g; dim V=1 | exceptional set finite/empty; induction base |
| §7.5 | diagonal; j₁=1728; j₁=1 | special, special, no CM pairs |
| §7.6 | Z=A; Z a Γ-fixed point | Z+A=Z; point torsion by no invariant vectors |
| §7.7 | dim component 0; dim X>0 | handled separately; inequality strict |
| §7.8 | pure S; pure part in A_g | pure abelian-type case; unconditional with Tsimerman |

## Checks run

- `lean-check …/Suggested.lean`: exit 0, ten `declaration uses sorry` warnings, no errors (free memory checked first).
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- The gate's `mech_check.py` (copied to scratch, run with `python3 -I`): no round-named labels; the three empty Lean layer sections and six `toDiophPoly_*` README identifiers are as before.
- A script checked all 280 internal links against the 130 anchors (none missing, link texts match headings).
- A Sonnet proofread of every changed range; its concrete defects were applied after checking each against the text.

## Notes for the maintainer

- Layer 7 states the André–Oort, CM-pair, abelian, Hodge and mixed applications under explicit hypotheses. The unconditional theorems follow once a roadmap proves the inputs; the restructure proposal in `packets/LogicAndDefinabilityInNumberTheoryPartII.json` (FunctionalTranscendenceForShimuraVarieties, FT.0–FT.6) is the natural owner of (I-def), (I-ws), (I-AL), the product-locus input and Gao's mixed inputs, and ComplexMultiplicationAndExplicitReciprocityPartII plans the orbit and lift-height bounds (`CMH.12/all-cm-orbit`, `CMH.13/cm-lift-height`; it states coordinate degree ≤2·(2g)!, Tsimerman §6.2 says 2g, and §7.1 takes any fixed k_g).
- This package now cites upstream ShimuraVarieties (PR #933) §§3.5a, 3.5d for R_an,exp o-minimality and definable Chow, which that PR already plans; LD keeps the general theory. PR #933 §3.5b.2 states the ordered-sector Hodge estimates for 0≤Re z_j≤1 only and plans BKT Theorem 1.5 without the curve lemma; §6.15 here covers every width.
- Stale atlas edges, not edited: the MC.4 packet cites `LD.3/geometric-realization-interface` (now LD consumes upstream Motives §4.20, so the edge is reversed); HodgeStructuresPartII README line 784 says LD.6 owns "existence/definability of curve families" (it should cite §6.15's curve test); ComplexComparisonPartII (PR #848) names LD.6 next to "*Needs:*" in a boundary sentence, which a supplier parser could misread; AbelianVarietiesIsogenousToNoJacobian's README plans o-minimal counting, definable uniformization and Ax–Lindemann for A_g "because no other roadmap plans them" while its packet imports LD.6 (cross-package duplication); AbelianSchemesAndArithmeticModuliPartII cites LD.6 for mixed Ax–Schanuel, which LD does not own.
- Cleared books used: Schneider, *p-Adic Lie Groups*, Proposition 6.4, p.42 (and §7); Bosch–Lütkebohmert–Raynaud, *Néron Models*, §7.3 Proposition 6, p.180. No passage was copied.
- Clearing van den Dries, *Tame topology and o-minimal structures*, would let a follow-up verify the four remaining **Gap.** markers (§§6.3–6.5, 6.9).
- No suspicious instructions were found in fetched pages or other authors' text.
