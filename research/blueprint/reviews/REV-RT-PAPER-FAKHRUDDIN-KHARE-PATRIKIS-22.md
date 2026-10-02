# Verification: RT-PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22

Job `REV-RT-PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22`, issue [#4163](https://github.com/CBirkbeck/tauceti-explorer/issues/4163). Codex, session `codex-5ebb6f`, 2 October 2026.

**46 confirmed, 0 rejected.** The machine-readable verdicts are in [RT-PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.review.json](../redteam/RT-PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.review.json). Each reason identifies the evidence and limits of the finding; confirmation does not endorse every sentence of its proposed fix.

## Independence and evidence

The extraction was written by `cc-39fac3`, reviewed by `cc-38267a`, and red-teamed by `cc-c2c06b`. I did none of that work. The red team's disclosures about its earlier BHKT, PQ, Boxer–Calegari–Gee and Newton–Thorne jobs were checked against the present files; those files are evidence of existing routes, not substitutes for mathematical evidence.

I read all 46 findings, their report, the extraction's relevant items, all five routes and 23 prerequisites, the cited source-issue corrections, and the original extraction/review reports. I checked the mathematical findings in the authors' [arXiv v5](https://arxiv.org/pdf/2008.12593v5), including the relevant proofs in §§2–9 and both appendices. Printed page numbers below are v5's. The downloaded 58-page PDF has SHA-256 `6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2`, matching the extraction. Formula checks also used rendered page images of pp. 15, 18, 36, 48, 50 and 55.

Additional primary sources read at the needed statements:

- [FKP19, arXiv 1904.02374v5](https://arxiv.org/pdf/1904.02374v5): Theorem A, the §5 inputs named in finding 15, and Appendix A's invariant, cohomological and cyclic-quotient lemmas. PDF SHA-256 `9ec2865cd2aad92fad7d1f14c018222a52c0d1d6f32b6c2b3c426423e2708efa`.
- [Bellovin–Gee, arXiv 1708.04885](https://arxiv.org/pdf/1708.04885): Theorem 3.3.3, Corollary 3.3.5 and Theorem 3.3.8, including the potentially crystalline `N=0` quotient. PDF SHA-256 `afe3ab33eedfd50c5fc943020e494b32d6515802723de982ba0da3848f00c587`.

For ownership I assembled the current atlas and read the relevant stage descriptions and reviewed packet nodes, especially R02.4/R02.5, R08.1/R08.2/L7, R32.4, R21.5/R21.6, ML.2, G7 and the cited arithmetic/automorphic suppliers. I compared PQ26 items 13/17/20, BHKT19 items 4/12/16/45/47, Newton–Thorne21 item 104, Liu et al.'s Guralnick input, and the Lawrence–Venkatesh and Boxer–Calegari–Gee records. Upstream ownership was checked in the imported Tau Ceti ClassFieldTheory Layers 5/7/13 and LocalFieldsRamification Layer 4.

The pinned libraries were Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and [Tau Ceti](https://github.com/TauCetiProject/TauCeti) `f790474821cf4256814db967cb154e7af3d0c369`. I read Mathlib's `LieAlgebra.IsKilling` and `killingForm_nondegenerate`, and Tau Ceti's `DynkinType.instIsKillingLieAlgebraBaseChange`, against the declaration index. Their difference matters for finding 16.

I did not obtain the paywalled published Inventiones text or the original Steinberg article, and did not independently review every cited prerequisite. Finding 5 is independently refuted by a matrix counterexample and checked against FKP19's precise Lie-algebra use. The prerequisite findings concern the actual citations and existing packet sources. No Lean claim of formalization is made.

## The disjointness counterexamples

Findings 2 and 3 concern false intermediate assertions, not counterexamples to Theorems B, C or E. The verified defect is that generation by an inertia element in each individual Galois group does not imply generation of their product by the same element.

For finding 2, take `k=F_p`, `p>=5`, and a nonsplit upper-triangular GL₂ residual representation in Lemma 7.1's range. Under the Killing identification, choose dual basis vectors `H(1), (H+E)(1), F(1)`. The first two generate the same module `b(1)`; both map to the same nonzero element under `f: b(1) -> (b/kE)(1)=Q`, where `Q=F_p(kappa)`. Non-splitness ensures no invariant complement to the root line, so both vectors generate `b(1)`.

Write the source's classes as `eta_i^v=theta_i+theta_i^v`. The classes `q_v=f(theta_1^v)-f(theta_2^v)` vanish on inertia at `v`, and the variable theta classes are unramified at the private primes and `t_0`. Thus `q_v` lies in the finite group `H¹(Gamma_{F,T_0},Q)` for the fixed set `T_0` omitting those private primes. Infinitely many available trivial primes force `q_v=q_v'` for distinct `v,v'`. Restricting to `Gamma_K`, where coefficient actions are trivial and coboundaries vanish, gives

```text
f(eta_1^v - eta_2^v - eta_1^v' + eta_2^v') = 0.
```

This is a nonzero linear functional on the product of the four Galois groups: it is nonzero on a tuple with only the first coordinate equal to its basis vector. The actual composite therefore cannot have that product as its Galois group. Private `t_b` ramification still proves disjointness for a fixed `v`; it does not prove Lemma 3.7 with both indices varying. The product example `GL₂×GL₂` with repeated absolutely irreducible three-dimensional adjoint constituent also shows why an arbitrary basis change is not a general repair: six cyclic coordinates contain six copies of the same constituent, whereas a cyclic module over its matrix endomorphism algebra has multiplicity at most three.

For finding 3, specialize to a nonsplit representation with `chi=kappa`. The root module `kE` and the quotient of `b(1)` generated by `H(1)` are both `Q=F_p(kappa)`. In the root-family variant of Proposition 3.6, pass to an infinite subfamily fixing the nonzero inertia scalar `h^a(tau_a)`; the finitely many choices allow this. Choose `lambda` so `lambda f(e_b*)` equals that scalar, and set

```text
xi_a = h^a - lambda f(eta_b^a).
```

It is unramified at `a`, so belongs to finite `H¹(Gamma_{F,T},Q)`. Two distinct choices give `xi_a=xi_a'`, hence

```text
h^a - h^a' = lambda f(eta_b^a - eta_b^a')  on Gamma_K.
```

Both sides are nonzero at `a`, proving a common nontrivial quotient field of the two composites. Also `xi_a(tau_t0)` is nonzero because every eta is unramified at `t_0`, so the common class obstructs the claimed disjointness of the combined tuple fields. This verifies the counterexample without assuming that the source's Chebotarev choices repair the relation.

The correction must distinguish each individual cyclic image, the composite for fixed `v`, and composites with repeated ramification primes. Items 20/22/25/97 and the design brief must mark the unresolved independence step. A reference to FKP19's earlier argument, or to inertia generation alone, is not yet a replacement proof. The current reader's assurance that the main theorems stand after routine repairs must be withdrawn to the extent that it asserts these new gaps are already repaired.

## Appendix and local-component checks

Finding 4 is an inverse-multiplier error in the SO exterior-square case; it is separate from E40's GSp symmetric-square correction. Finding 5 corrects the group-element/Lie-element confusion. The PGL₂ matrix counterexample disproves the extraction's group-element statement even in an adjoint group; FKP19's use centralizes a semisimple **Lie-algebra** element with its characteristic restrictions.

For finding 19, specifying an ordinary potentially semistable component and inertial type on p. 36 does not force crystalline monodromy in weight 2. The crystalline point may also lie on a semistable ordinary component allowing `N!=0`. BG19 provides the `N=0` quotient as a union of components. The fix should explicitly choose and justify an ordinary component of this quotient. It should not claim that every local point or every possible component choice fails, or that Theorem 7.4 itself is disproved.

For finding 20, use a nonzero crystalline extension `r=(epsilon,c;0,1)` over Qₚ. Its adjoint Borel sequence has connecting map

```text
H¹(t) -> H²(E(1)),  phi |-> c cup (phi_2-phi_1).
```

Local Tate duality makes it onto, so `h²(r(b))=0`. Crystalline Kummer classes pair trivially with unramified characters. The image of `H¹(r(b))` in the two-dimensional inertial torus space is therefore one-dimensional. With `h⁰(r(b))=1`, local Euler characteristic gives `h¹(r(b))=4`; the framed Borel tangent dimension after fixing inertia is `3-1+4-1=5`. The flag adds one dimension, yielding tangent dimension six. The completion is a quotient of the five-dimensional potentially semistable ring by the p. 54 moduli comparison. Thus the printed zero-relation presentation would have the wrong dimension.

A presentation before minimizing may instead use `dim Z¹(r(b))+dim(n)=7` variables and at most `h²(r(b))+[Q_p:Q_p]dim(t)=2` relations. In general, counting the fixed-inertial-character equations as well as the Borel obstruction equations recovers the lower bound needed by Lemma B.4. The fixed-multiplier version must make the same adjustment. This verification confirms the faulty relation count; the eventual fixed extraction should state and justify the revised presentation, not confuse a tangent bound with a bound on the number of defining relations.

Findings 25, 42, 43 and 45 likewise need precise scope. Dominance fixes the ordinary filtration orientation, regularity fixes the full-flag dimension, the exceptional-exponent bound depends on cyclotomic degree, and `G_n^der` is SLₙ. In the character comparison the zero exponents of Definition A.13 supply the missing trivial constituent. That comparison is printed on **p. 50**, correcting finding 45's p. 49 locator.

## Ownership and fix instructions

The verdict reasons give the individual source and node checks. Several proposals need coordinated refinements:

- Split R08.2's local generic-fibre theorem from the Part II's FKP Selmer-condition construction. Reuse PQ26's framed G-valued functor and BHKT19's unframed semisimple contract, recording extensions beyond their hypotheses.
- Greenberg–Wiles belongs to the reviewed R02.5 node. The two appended variants of finding 9 disagree about R02.6; follow finding 8. Split equal-characteristic local duality from global duality, and explicitly request the missing local export and extension of the number-field global contract. Reciprocity in FA.4 alone is not already the required duality theorem. Keep BHKT19 item 45 synchronized.
- Tame inertia imports Tau Ceti LocalFieldsRamification Layer 4. The pro-p **inertia** projection retains full procyclic Frobenius. Do not replace it by the pro-p quotient of the entire group.
- Reconcile G-semisimplification and Guralnick to single generic suppliers, retaining the finite-field rationality refinement and the faithful-quotient/cohomological hypotheses. Proposed owners are coordination requests until settled.
- Reuse ML.2's existing BLGGT and iota-ordinary nodes. Newton–Thorne21 item 104 already records the same Steinberg modification. The ANT-based residual-reducible compatible-system argument is an extension of the earlier proof, not a direct application of its residually irreducible theorem.
- Mathlib's `IsKilling` infrastructure is not restricted to characteristic zero; what is missing is the required finite-characteristic reductive instance/theorem. Tau Ceti's inspected scalar-extension instance does require a Q-algebra.
- The crystalline/level equivalence concerns a newform at its minimal conductor. Kronecker–Weber extends the particular local character unramified outside p only with the `Art(p)=1` normalization already recorded by item 109/E28.
- Use distinct new source-issue ids: findings 19 and 20 both propose E45, already proposed for finding 2. Correct consequential statements and dependencies without assigning every new issue `affects: nothing`.
- Regenerate reader counts from the final result after all item/prerequisite changes. Today's JSON has 119 items, 13 planned, 106 missing, 23 prerequisites and 44 source issues; those are evidence of the stale reader, not prescribed final counts.

No upstream roadmap, packet, extraction or red-team result was changed by this verification. The confirmed findings and these qualifications are the fix/design handoff.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22.review.json`
- `python3 research/blueprint/intake.py check-files` on the two deliverables.
- Exact comparison with the red-team result: all 46 ids occur once, in order, with a nonempty evidence-specific reason.
- `git diff --check` and a deliverable-only staged-path check.

No Lean file is delivered. No Lean compilation, Lake cache fetch or build was run.
