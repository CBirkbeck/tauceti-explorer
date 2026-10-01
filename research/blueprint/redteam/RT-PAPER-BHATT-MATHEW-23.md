# Red team: Bhatt–Mathew (2023)

Issue #4220. Codex, session `codex-rtOQ9t`. Completed 1 October 2026 against atlas commit `c7966dbe0e1d20a6f81f5cf080069055507224ed`. The extraction and its review were by other sessions. Only this audit's two deliverables are changed.

Two findings concern acceptance tests. The main theorem extraction, its 74 missing-item routes, and the eight recorded source corrections are retained.

| Finding | Severity | Required correction |
|---|---|---|
| /1 | High | Test the derived fppf-to-étale pushforward in weight one over Z_p. |
| /2 | Medium | Give the displayed Kummer symbol a domain on which both entries are units. |

## 1. Weight one retains a Kummer cokernel

The required test identifies Z/p(1) over Z_p with the ordinary étale sheaf μ_p. This is false: it discards the nonzero degree-one Kummer cokernel at the closed geometric point. The correct formula already appears in item /006; the route must test that derived formula.

**Location:** research/blueprint/papers/PAPER-BHATT-MATHEW-23.result.json, routes[0].brief, first acceptance example (A = Z_p); compare item /006.

Bhatt–Mathew, Example 1.5, published p. 2 (https://doi.org/10.1017/fmp.2022.21; arXiv:2202.04818v2 TeX lines 212–218), describes the “derived pushforward” from fppf to étale, equivalently fib(p:G_m→G_m), whereas Example 1.2 identifies it with the ordinary μ_p only on the locus where p is invertible. The route says “A = Z_p: F-smooth, with Z/p(1) = μ_p”. For p=3 let R be the strict henselization of Z_3 at the closed geometric point. Taking stalks of the fibre gives H^1=R^×/(R^×)^3. The class of 4=1+3 is nonzero: if u^3=4, reduction in the characteristic-three residue field forces u≡1 mod 3, hence u=1+3a and u^3≡1 mod 9, contradicting 4≢1 mod 9. The ordinary étale sheaf μ_3, placed in degree zero, has H^1=0. This is a difference of cohomology sheaves, not merely a difference of global sections.

**Repair:** Replace that acceptance example with Z/p(1)_{Spec Z_p} ≃ Rε_*μ_p ≃ fib(p:G_m→G_m) in D((Spec Z_p)_et), with ε the fppf-to-étale map. Require H^0=μ_p on the étale site and H^1=coker(p:G_m→G_m), including the nonzero class of 4 at the closed geometric point for p=3. Separately test restriction to Spec Q_p, where the complex is the ordinary étale μ_p. Retain item /006 and the existing owner PR.4/PR.5.

## 2. The symbol test needs an open domain

The proposed Kummer-symbol test has no specified domain on which its two entries are units. Neither t nor 1+pt is a unit of Z_p[t], and both have zeros on A^1_{Q_p}. Consequently the displayed cup product is not defined there as the global unit-symbol test stated by the brief. This is a repairable domain error in the test, not a defect in the Bloch–Kato theorem.

**Location:** research/blueprint/papers/PAPER-BHATT-MATHEW-23.result.json, routes[1].brief, final unit test “the symbol {1 + pt, t} on the affine line over Z_p”.

Bloch–Kato §1.2, printed pp. 110–111 (https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), defines the symbols using local sections of i*j_*G_m and the Kummer map. Its formula (4.3), printed p. 122, uses unit lifts for the dlog entries. Bhatt–Mathew Proposition 5.6, published p. 23 (https://doi.org/10.1017/fmp.2022.21), likewise uses unit entries. On A^1_{Z_p}, t vanishes along t=0; on its generic fibre 1+pt vanishes at t=−1/p. Thus neither supplies the asserted global G_m section. Although a symbol can be studied on a suitable neighbourhood or as a rational symbol with additional extension arguments, no such restriction or argument is specified by the route.

**Repair:** Specify U=Spec Z_p[t,1/(t(1+pt))] (or the p-henselization of the punctured affine line) and form {1+pt,t} on U[1/p], then restrict to the nearby-cycle sheaf on U_Fp. Both entries are now units. Check the Bloch–Kato identification ρ_1(t dlog t)=ρ_1(dt)={1+pt,t}; on U_Fp=G_m,Fp this gives a concrete differential test. Keep this correction local to the reused Part II brief; no new owner or roadmap is needed.

## Reproducing the first counterexample

Let R be the strict henselization of Z_3 at its closed geometric point. Its maximal ideal is 3R. The exact stalk sequence for the fibre of the cube map identifies H¹ with R×/(R×)³. If u³=4, then in the residue field (u−1)³=0, so u=1+3a. Binomial expansion gives u³=1+9a+27a²+27a³, impossible modulo 9. Thus [4] survives in the degree-one cohomology sheaf. A sheaf μ_3 concentrated in degree zero has no such cohomology. This tests the derived category object, without confusing its sheaf cohomology with global hypercohomology.

The finite calculation below is a sanity check; the preceding binomial argument proves the assertion over the strict henselization, including all unramified residue extensions.

```python
cubes = {pow(u, 3, 9) for u in range(9) if u % 3}
assert cubes == {1, 8}
assert 4 not in cubes
```

For /2, localization at t(1+pt) makes both entries invertible. On the special fibre this open is G_m, and t dlog(t)=dt identifies the proposed symbol with a specific input to Bloch–Kato's rho_1. No claim that the rational symbol extends across its missing divisors is needed.

## Source and coverage record

The published [Bhatt–Mathew article](https://doi.org/10.1017/fmp.2022.21) was read in full, all 26 pages. The [arXiv v2 source](https://arxiv.org/e-print/2202.04818v2) supplies a reproducible companion; its hash agrees with the extraction. Published p. 2 was also checked visually. Every extracted item, route, sourceIssue, prerequisite and the acceptance review was read. The exact coverage and ownership checks are listed in the JSON `checked` field.

| Source | Read in this audit | SHA-256 |
|---|---|---|
| [Published Bhatt–Mathew PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S205050862200021X) | All pp. 1–26 | `8ab6408c528c5b9c53f8f68276c018e141eab19baa332a23c4d23992343bbb3e` |
| [Bhatt–Mathew arXiv v2 PDF](https://arxiv.org/pdf/2202.04818v2) | Companion acquisition; targeted comparisons use TeX | `12eb19e417531addbcf70d85facf33b1649ba5d8845c31ade9128c6000032955` |
| [Bhatt–Mathew v2 e-print](https://arxiv.org/e-print/2202.04818v2) | Finding and source-correction passages | `d1332b570f2338edf59c4c2d578a1db5fe3205db47460342192c1b7fbf525b39` |
| [Bloch–Kato (1986)](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf) | Printed pp. 110–112,122,136–137: symbols, filtration, rho and residue | `51cf9c3fe85c3d55a6af56c9789c831b810cdd4c9b2c275057dcde6c14730dc8` |
| [Sato (2007)](https://www.numdam.org/item/ASENS_2007_4_40_4_519_0.pdf) | Printed pp. 533,536–537: kernel theorem and twist definition | `e9c6692f13425781ccf3e470b0e3bf71c50d0833318da74befca01fe91a28f34` |
| [Bhatt–Scholze v4](https://arxiv.org/pdf/1905.08229v4) | p. 97, Theorem 14.1 and opening of §14 | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |

Accessed 1 October 2026. Cambridge's per-download watermark explains its changing hash. The prerequisite papers received the stated selective checks, not full independent audits. Neither finding asserts an error in those sources.

| Main-paper block | Extraction coverage checked |
|---|---|
| §§1–2: definitions, sheaves, Kummer, twists, theta and v_1 | /001–029 |
| §3: filtrations, relative perfectness, polynomial and quotient calculations, imported inputs | /030–050 |
| §4: amplitude, F-smoothness, regularity and Hodge–Tate dimension | /051–084 |
| §5: comparison, symbols, residues and Sato | /085–102 |

The eight prior source corrections are not counted as new findings. In particular E6's semistable example still disproves the displayed single-uniformizer decomposition; the extraction already requires the missing multi-branch argument or a restricted theorem. A route test cannot silently remove that limitation.

At the pinned libraries, the two positive regular-ring claims hold. Polynomial regularity is also present. The presentation-level cotangent map and generic t-structure carrier do not supply animated cotangent complexes or the filtered Beilinson comparison. Tau Ceti's regular-stalk tangent-dimension theorem likewise does not supply the regular-local factoriality or localization results requested by this extraction. Full-tree targeted searches found no replacement for those missing items; no universal absence claim is made.

The 27 planned items resolve, all 74 missing items occur in exactly one route, and the two Part II parents exist. The fresh atlas has 2,907 stages and 8,322 stage edges, including 76 external/proxy edges; its induced graph on known stages is acyclic. There is no item-level dependency graph in the target packet. The current stage and supplier-request checks support the existing ownership; no routing change is proposed.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BHATT-MATHEW-23.result.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-BHATT-MATHEW-23.result.json research/blueprint/redteam/RT-PAPER-BHATT-MATHEW-23.md`
- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-MATHEW-23.result.json`
- `git diff --cached --check`

No Lean deliverable is requested. No Lean compilation, package download, library build or language server was run. The findings and mathematical counterexample remain subject to the independent red-team verification required by the protocol.
