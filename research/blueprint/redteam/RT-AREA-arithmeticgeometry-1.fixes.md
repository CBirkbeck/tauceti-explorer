# RT-AREA-arithmeticgeometry-1: fixes

Fixer: Claude Code, session `cc-48533a`, 29 September 2026 (issue #3961, job FIX-RT-AREA-arithmeticgeometry-1).

- Findings: `RT-AREA-arithmeticgeometry-1.result.json`, one finding.
- Verdict: `RT-AREA-arithmeticgeometry-1.review.json`, which confirms it with corrections.

This job's only deliverable is this report. The finding names a layer, AbelianSchemesAndArithmeticModuli:A4, and "the atlas as a whole", not a file, so the queue gives the job no file to edit. The fix is therefore written below as exact edits:

- a rescope of A4, for the maintainer;
- six new nodes, with their sources, requests and gaps, for the AbelianSchemesAndArithmeticModuli packet. The maintainer can apply them, or the next checkpoint of the blueprint job (#666) can take them over.

Every edit was checked at origin/main 197dc2ca and at the pins (Mathlib 082e2d3, Tau Ceti f790474). The appendix shows how.

## /1 (medium, missing): the all-degree Hodge and de Rham cohomology of an abelian scheme is planned under A4

### What the verifier corrected

The verifier confirmed the finding, but as a scope conflict rather than as unrouted mathematics.

- PAPER-ANSCHUTZ-LEBRAS-23 item /97 already routes the whole package to A4, through the accepted route 7.
- A4's own description stops at degree one: "These are degree-one statements; invoking the full Hodge or étale comparison theorem as an unnamed dependency is unnecessary."
- The accepted RS-02 narrows A4 to a `keeps` text that lists only degree-one realizations, and PROTOCOL.md section 15 makes that text binding.

The verifier also corrected the proof strategy the finding proposed:

- **FARB-KISIN-WOLFSON-24 /065 is a different theorem.** It is the mod-p étale cohomology of an abelian variety over an algebraically closed field of characteristic zero, the analogue of Milne's Theorem 12.1. It is not the relative de Rham or Hodge statement over a general base.
- **Route 17 is not in force.** That paper's overall review verdict is "revise", so the queue does not apply route 17.
- **The right source** is Anschütz–Le Bras, Proposition 4.5.1, with the result it cites, Berthelot–Breen–Messing 2.5.2.
- **Keep the hypotheses as inspected.** Keep Anschütz–Le Bras's bounded-prism and p-adic-completion hypotheses unless BBM's broader generality is verified. Over a nonaffine base, state the theorem for the higher direct images, not for global modules.
- **Two things to avoid.** Do not obtain finite local freeness over an arbitrary base from complex uniformization. Keep the main theorem unbuilt.

This fix follows every one of these corrections.

### Where the mathematics goes, and why A4

- **Nothing else owns it.** Every stage description in `data/atlas.json`, every node of `research/blueprint/packets/` and `data/decompositions/`, and every new-roadmap definition was searched for:
  - the higher de Rham or Hodge cohomology of abelian schemes or varieties;
  - the exterior-algebra isomorphism;
  - Berthelot–Breen–Messing.

  Nothing plans them. The one node that matched, GeneralizedHeegnerCycles GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images, is about cycles on products of elliptic curves and does not state the theorem.
- **The libraries lack it.** The pinned libraries have no algebraic de Rham cohomology. Tau Ceti has sheaf cohomology of 𝒪_X-modules (`TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, read at f790474), and Mathlib has the exterior algebra and its ranks. Both are cited as baseline below.
- **A4 is the right owner.** The general theories nearby (DerivedDeRhamCohomology, CrystallineCohomology) are not about abelian schemes. The pending Part II design job for this roadmap (#3351) goes in other directions: the universal vector extension, Betti maps and finite fields. A4 already owns H¹_dR, and the statement is its all-degree completion, so A4 is the owner the finding names.

The package is planned there as an explicit extension of the degree-one scope. It rests on A4's degree-one outputs and replaces none of them. It needs the rescope below to be inside RS-02's contract. Until the rescope is applied, the new nodes carry `realises: []`: they are parented at A4 but realise no target A4 now states.

### The generality, checked rather than assumed

Berthelot–Breen–Messing (LNM 930) could not be read: no free copy exists. The statement was therefore established from sources that could be read.

- **Anschütz–Le Bras, arXiv v4, §4.5, p. 53.** Proposition 4.5.1 is stated for "the p-adic completion of an abelian scheme over Spec(Ā)", with Ā = A/I for a bounded prism (A, I). Its proof is the single sentence "This is [6, Proposition 2.5.2. (i)-(ii)]."
- **Kurama, arXiv:2410.14065v2, Lemma 4.1.** Kurama states BBM 2.5.2 for "an abelian scheme over a locally noetherian scheme S". His statement covers cup-product isomorphisms, E₁-degeneration, local freeness and compatibility with base change. His Lemma 4.3 and Proposition 4.2 give the Hodge-filtration pieces and the filtered isomorphism.
- **The nodes give a proof over an arbitrary base.** It uses only sources that were read:
  - Milne's Lemma 12.2 (Hopf algebras) for the field case;
  - A4's degree-one H¹_dR and A2's Lie(A^∨) ≅ R¹f_*𝒪_A as the degree-one inputs;
  - Stacks 0FM0 (perfectness and base change of Rf_*Ω^• and Rf_*σ_{≥p}Ω^•);
  - Stacks 0A1U, the splitting criterion, which turns fibrewise-surjective base-change maps into finite local freeness in every degree.

  Over a nonreduced base, alternation (x ∪ x = 0 for x in H¹_dR) does not follow from the fibres. It is proved from the group law: x is primitive, so x² is primitive, and H² has no nonzero primitive elements.
- **The prismatic form is its own node.** It is stated with Anschütz–Le Bras's hypotheses: Ā p-adically complete with bounded p^∞-torsion, and X the p-adic completion. Its proof passes from the scheme to its completion by derived p-completion. So the consumer gets exactly the statement it cites.
- **One input stays open.** Milne's Lemma 12.2 rests on Borel's structure theorem for graded Hopf algebras over a perfect field. Milne cites it without proof, and Hatcher (§3.C) states it only for finite fields. It is recorded as a gap (see "Notes for the maintainer").

### The plan: six nodes under A4

| Node | Kind | Content |
|---|---|---|
| `A4/hopf-algebra-exterior-criterion` | lemma | Milne, Lemma 12.2. Let H be graded-commutative over a perfect field, with H⁰ = K, H^r = 0 for r > d, and a coproduct of the shape m*(x) = x⊗1 + 1⊗x + (terms of positive bidegree). Then dim H¹ ≤ d, and equality gives x² = 0 on H¹ and H ≅ ∧^•H¹. Rests on Borel (gap). |
| `A4/cohomology-of-the-structure-sheaf` | theorem | R^if_*𝒪_A is finite locally free of rank C(g, i) and commutes with arbitrary base change, and ∧^•R¹f_*𝒪_A ≅ R^•f_*𝒪_A (the field case is Mumford §13, Corollary 2). |
| `A4/hodge-cohomology-of-an-abelian-scheme` | theorem | R^if_*Ω^j ≅ R^if_*𝒪_A ⊗ ∧^jω, finite locally free of rank C(g, i)C(g, j), commuting with base change. |
| `A4/hodge-to-de-rham-degeneration` | theorem | H^n_dR(A/S) is finite locally free of rank C(2g, n) and commutes with base change. The Hodge-to-de Rham spectral sequence degenerates at E₁: each R^nf_*σ_{≥p}Ω^• injects onto a local direct summand F^p, with F^p/F^{p+1} ≅ R^{n−p}f_*Ω^p. |
| `A4/de-rham-cohomology-is-an-exterior-algebra` | theorem (planet "de Rham cohomology of an abelian scheme") | H^•_dR is alternating in degree 1, and ∧^•H¹_dR ≅ H^•_dR as graded algebras. The isomorphism is filtered for the Hodge filtration and compatible with base change. |
| `A4/de-rham-cohomology-of-the-p-adic-completion` | lemma | Anschütz–Le Bras's form: over Ā p-adically complete with bounded p^∞-torsion, the cohomology of the p-adic completion X equals that of the abelian scheme. Hence Proposition 4.5.1 as stated there. |

They depend on each other in this order: the lemma, then the structure sheaf, Hodge cohomology, de Rham degeneration, the exterior algebra, and finally the p-adic form. Their inputs outside the six nodes are:

- A1 (translation-invariant differentials, Ω¹ ≅ f^*ω);
- A2 (Lie(A^∨) ≅ R¹f_*𝒪_A; at field level T₀Pic ≅ H¹(A, 𝒪) and dim A^∨ = g);
- A4's degree-one H¹_dR and its Hodge exact sequence.

These three are added to the `remaining` lists of A1, A2 and A4, so that the future blueprint of those layers supplies exactly what the new nodes import.

The new requests to other roadmaps are:

- **DerivedDeRhamCohomology DD.2**: the relative de Rham formalism for proper smooth morphisms (Stacks 0FM0, 0FM3, 0FM6, 0FM8 and 0FMC).
- **Tau Ceti JacobianChallenge Layer C**: cohomology and base change (Stacks 0B91 and 0A1U), the projection formula (08EU) and Künneth (0FLQ).
- **SchemeAndStackFoundations SF.2**: Grothendieck vanishing.
- **DerivedDeRhamCohomology DD.1**: derived p-completion over a ring with bounded p^∞-torsion.
- **EnhancedDerivedSheaves E4**: RΓ of a p-adic completion as R lim.

### Edit 1, for the maintainer: rescope A4 (RS-02 and the A4 description)

The same text is recorded as a `rescope` entry in the packet's `restructure` list (PROTOCOL.md section 9), so the orchestrator collects it with the other proposals.

- **Add to RS-02's `keeps` for AbelianSchemesAndArithmeticModuli:A4, and to A4's description:**
  > For an abelian scheme f : A → S of relative dimension g, prove that R^if_*𝒪_A, R^if_*Ω^j_{A/S} and H^n_dR(A/S) are finite locally free of ranks C(g, i), C(g, i)C(g, j) and C(2g, n) and commute with arbitrary base change, that the Hodge-to-de Rham spectral sequence degenerates at E₁, and that the cup product gives isomorphisms ∧^•R¹f_*𝒪_A ≅ R^•f_*𝒪_A and ∧^•H¹_dR(A/S) ≅ H^•_dR(A/S) of graded algebras, the second filtered (Berthelot–Breen–Messing, Proposition 2.5.2); state the p-adic completion form that prismatic Dieudonné theory uses.
- **Narrow the self-limiting sentence.** Replace "These are degree-one statements; invoking the full Hodge or étale comparison theorem as an unnamed dependency is unnecessary." with "The Hodge and étale comparison theorems are not invoked as unnamed dependencies." That is what the sentence was for, and it then no longer excludes the higher-degree statements.
- **Retitle the layer.** Change "Degree-one realizations and deformation theory" to "Realizations and deformation theory".
- **Add a requirement.** Add DerivedDeRhamCohomology:DD.2 to A4's `requires`, as the supplier of the relative de Rham formalism. In the atlas's stage graph A4 is not an ancestor of DD.2, nor of any other supplier requested here (DD.1, EnhancedDerivedSheaves E4, SchemeAndStackFoundations SF.2), so none of the new dependencies closes a cycle.

### Edit 2: the packet additions

Apply these to `research/blueprint/packets/AbelianSchemesAndArithmeticModuli.json`.

- Append each list to the packet field its key names.
- Append the Milne reading record to that source's `readSections`.
- Replace the A1, A2 and A4 records of `coverage` with those given.
- Add a sentence to the packet summary, for example: "The red-team fix FIX-RT-AREA-arithmeticgeometry-1 adds six A4 nodes planning the all-degree Hodge and de Rham cohomology of an abelian scheme (Berthelot–Breen–Messing 2.5.2)."

`restructure` is a new key: the packet has none yet. On the patched packet, `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings, with 27 nodes, 10 requests and 4 gaps. Every excerpt was matched verbatim against the text of the source file it cites.

For the roadmap document (`research/blueprint/readmes/AbelianSchemesAndArithmeticModuli.md`):

- Section "A4" gains a "Theorems" subsection with the six nodes, in the format of the A6 entries (statement, hypotheses, proof, acceptance, uses, sources). Its "What is missing" becomes the new A4 `remaining` list.
- "Requests", "Gaps", "Library baseline" and "Sources" gain the new entries.

For the suggested file (`research/blueprint/suggested/AbelianSchemesAndArithmeticModuli.lean`):

- Abelian schemes over a base are not in either pinned library, so the six results go into the header's list of planned signatures.
- The Mathlib-only part below was elaborated at Mathlib 082e2d3 (`lake env lean`, no errors or warnings). It can be appended as a new section.

```lean
import Mathlib.Data.Nat.Choose.Vandermonde
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis

/-- The Hodge numbers `C(g, q) * C(g, p)` of an abelian scheme of relative dimension `g` sum, in
total degree `n`, to `C(2g, n)`: the upper bound in
`AbelianSchemesAndArithmeticModuli:A4/hodge-to-de-rham-degeneration`. -/
theorem sum_hodgeNumbers (g n : ℕ) :
    ∑ pq ∈ Finset.antidiagonal n, g.choose pq.1 * g.choose pq.2 = (2 * g).choose n := by
  rw [two_mul, Nat.add_choose_eq]

/-- Test: an elliptic curve (`g = 1`) has de Rham ranks `1, 2, 1`. -/
example : ((2 * 1).choose 0, (2 * 1).choose 1, (2 * 1).choose 2) = (1, 2, 1) := by decide

/-- Test: the total rank of the de Rham cohomology of an abelian surface is `2 ^ 4`. -/
example : ∑ n ∈ Finset.range 5, (2 * 2).choose n = 2 ^ 4 := by decide

/-- The rank count of `…/de-rham-cohomology-is-an-exterior-algebra`: `⋀ⁿ` of a free module of
rank `r` is free of rank `C(r, n)`. -/
example {R M : Type*} [CommRing R] [Nontrivial R] [AddCommGroup M] [Module R M]
    [Module.Free R M] [Module.Finite R M] (n : ℕ) :
    Module.finrank R (⋀[R]^n M) = (Module.finrank R M).choose n := by
  simp

/-- The canonical map `∧• H¹ → H•` exists once `H¹` is alternating: `ExteriorAlgebra.lift`. -/
noncomputable example {R M A : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Ring A]
    [Algebra R A] (f : M →ₗ[R] A) (hf : ∀ m, f m * f m = 0) : ExteriorAlgebra R M →ₐ[R] A :=
  ExteriorAlgebra.lift R ⟨f, hf⟩
```

Planned signatures, relative to a future `TauCeti.AlgebraicGeometry.AbelianScheme` carrier (A1). Here `H i`, `H i j` and `HdR n` are the higher direct images R^if_*𝒪_A, R^if_*Ω^j and R^nf_*Ω^•:

```text
theorem AbelianScheme.structureSheafCohomology_isLocallyFree (A : AbelianScheme S) (i : ℕ) :
  IsLocallyFreeOfRank (H i) (g.choose i) ∧ CommutesWithBaseChange (H i)
noncomputable def AbelianScheme.exteriorStructureSheafCohomologyEquiv :
  ExteriorAlgebra 𝒪_S (H 1) ≃ₐ[𝒪_S] ⨁ i, H i
theorem AbelianScheme.hodgeCohomology_iso (i j : ℕ) : H i j ≅ H i ⊗ ⋀^j ω
theorem AbelianScheme.deRhamCohomology_isLocallyFree (n : ℕ) :
  IsLocallyFreeOfRank (HdR n) ((2 * g).choose n) ∧ CommutesWithBaseChange (HdR n)
theorem AbelianScheme.hodgeDeRham_degenerates : (hodgeDeRhamSpectralSequence A).DegeneratesAt 1
noncomputable def AbelianScheme.exteriorDeRhamEquiv :
  ExteriorAlgebra 𝒪_S (HdR 1) ≃ₐ[𝒪_S] ⨁ n, HdR n   -- filtered for the Hodge filtration
```

### What the routes need

- **PAPER-ANSCHUTZ-LEBRAS-23, route 7.** The route stands as accepted. Once edit 2 is applied, item /97 can be marked `planned`, at `A4/de-rham-cohomology-of-the-p-adic-completion`. That node states exactly the paper's Proposition 4.5.1, in the paper's own setting.
- **PAPER-FARB-KISIN-WOLFSON-24, route 17.** This route is not applied (the paper's review says "revise"), and it is not the source for this package. Item /065 is the étale statement, over an algebraically closed field of characteristic zero. Its de Rham analogue is not its proof. When that paper is revised, its item /065 can import `A4/hopf-algebra-exterior-criterion`, the algebraic half of Milne's Theorem 12.1. The étale comparison half belongs with A4's étale Tate-module part, which RS-02 already keeps. No edit to either paper file is made here: neither is a file of this job.

### Notes for the maintainer

- **Borel's structure theorem has no owner.** A graded-commutative, connected Hopf algebra of finite type over a perfect field is, as an algebra, a tensor product of monogenic ones. It is general algebra, not abelian-scheme theory, and no layer plans it. It is recorded as a gap on `A4/hopf-algebra-exterior-criterion`. If an algebraic-topology or Hopf-algebra layer takes it, the gap becomes a request.
- **The relative de Rham formalism for proper smooth morphisms has no stated owner either.** This covers perfectness and base change, the cup product, the Hodge filtration and Künneth. The request goes to DerivedDeRhamCohomology DD.2, the nearest layer: it owns the de Rham complex with its Hodge filtration, its comparison with the ordinary de Rham complex for smooth maps, and its sheaves on schemes. DD.2's description does not name the proper-pushforward statements. They are needed by A4's degree-one H¹_dR as well, so they should be named in one place, and DD.2 is the natural one.
- **Planets.** The only planet added is on `A4/de-rham-cohomology-is-an-exterior-algebra`. A4 has no other planets yet.

## What was checked

- **The finding and its verdict:** both read in full. So were A4's description and RS-02's entries for A0–A6, with RS-02's review, and the items and routes of both papers (ANSCHUTZ-LEBRAS-23 /97 with route 7; FARB-KISIN-WOLFSON-24 /065 with route 17) together with their reviews.
- **Anschütz–Le Bras, arXiv:1907.10525v4** (SHA-256 `6eb02c16…b50aec`): §4.5, Propositions 4.5.1 and 4.5.2 with proofs, Lemma 4.5.3 (pp. 53–55), and the bibliography entries for BBM. The Forum of Mathematics, Pi version (where 4.5.1 is 4.57) was not read.
- **Kurama, arXiv:2410.14065v2** (SHA-256 `e7942fbc…40138f`): §4.1, Lemma 4.1, Proposition 4.2 and Lemmas 4.3–4.4 with proofs.
- **Milne, Abelian Varieties v2.00** (SHA-256 `f5ca4e63…f6aaef`, the copy the packet already cites): §12, Theorem 12.1, identity (3), Lemma 12.2 with proof, Remarks 12.3–12.5.
- **Hatcher, Algebraic Topology** (SHA-256 `bebb3032…e5618`): §3.C, pp. 283–285.
- **The Stacks Project:**
  - de Rham Cohomology (SHA-256 `d1dc49a3…1c42`): Sections 2–8, Tags 0FM0–0FMC;
  - Derived Categories of Schemes (SHA-256 `f79e0ebb…2fb02`): Tags 08EU, 0FLQ, 0E62 and 0E0L;
  - Tag 0A1U.
- **Where BBM's text was looked for:** it was not found openly, and its 2.5.2 is used only as the attribution. A web search for its statement led to Kurama and to Coleman, "Duality for the de Rham cohomology of an abelian scheme" (Ann. Inst. Fourier 48, 1998; read for its citation of BBM only).
- **The pinned libraries** (declaration index and source at the pins):
  - Tau Ceti has sheaf cohomology of 𝒪_X-modules (`Scheme.Modules.Cohomology`, with long exact sequences and Mayer–Vietoris), but no de Rham cohomology, no base-change theorem and no abelian schemes.
  - Mathlib has `ExteriorAlgebra`, `ExteriorAlgebra.lift`, `exteriorPower.finrank_eq` and `Nat.add_choose_eq`. Each was read at 082e2d3.
- **The atlas and the other packets:** searched as described above for any other owner, including the Part II design job #3351's brief.
- **The checker:** `scripts/check_blueprint.py` on the patched packet reported 0 errors and 0 warnings, with the pinned declaration index. The Lean prototype elaborated at Mathlib 082e2d3.

## Appendix: the packet additions (edit 2)

```json
{
 "baseline.declarations (append)": [
  {
   "ref": "tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology",
   "kind": "abbrev",
   "module": "TauCeti/AlgebraicGeometry/Cohomology/Basic.lean",
   "provides": "The cohomology group H^i(X, M) of a sheaf of modules M on a scheme X (Mathlib's Sheaf.H applied to its underlying abelian sheaf); the groups H^i(A, O_A) and H^i(A, Ω^j) over a field are its values.",
   "checked": "declaration read in the Lean source at the pinned commit (Tau Ceti f790474), 2026-09-29"
  },
  {
   "ref": "mathlib:ExteriorAlgebra",
   "kind": "abbrev",
   "module": "Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean",
   "provides": "The exterior algebra of an R-module, as the Clifford algebra of the zero quadratic form.",
   "checked": "declaration read in the Lean source at the pinned commit (Mathlib 082e2d3), 2026-09-29"
  },
  {
   "ref": "mathlib:ExteriorAlgebra.lift",
   "kind": "def",
   "module": "Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean",
   "provides": "A linear map f : M → A into an R-algebra with f(m)·f(m) = 0 for all m extends uniquely to an R-algebra map ExteriorAlgebra R M → A: the canonical map ∧^•H^1 → H^* once H^* is alternating.",
   "checked": "declaration read in the Lean source at the pinned commit (Mathlib 082e2d3), 2026-09-29"
  },
  {
   "ref": "mathlib:exteriorPower.finrank_eq",
   "kind": "lemma",
   "module": "Mathlib/LinearAlgebra/ExteriorPower/Basis.lean",
   "provides": "For M finite free of rank r over a nontrivial ring, ⋀^n M is free of rank C(r, n).",
   "checked": "declaration read in the Lean source at the pinned commit (Mathlib 082e2d3), 2026-09-29"
  },
  {
   "ref": "mathlib:Nat.add_choose_eq",
   "kind": "theorem",
   "module": "Mathlib/Data/Nat/Choose/Vandermonde.lean",
   "provides": "Vandermonde's identity C(m + n, k) = Σ_{i+j=k} C(m, i)C(n, j): with m = n = g it sums the Hodge numbers of an abelian scheme to C(2g, k).",
   "checked": "declaration read in the Lean source at the pinned commit (Mathlib 082e2d3), 2026-09-29"
  }
 ],
 "sources (append)": [
  {
   "id": "anschutz-lebras-prismatic-dieudonne",
   "title": "Prismatic Dieudonné theory",
   "authors": "Johannes Anschütz and Arthur-César Le Bras",
   "edition": "arXiv:1907.10525v4 (11 October 2022); published in Forum of Mathematics, Pi 11 (2023), e2, where Proposition 4.5.1 is numbered 4.57 (the published text was not read)",
   "url": "https://arxiv.org/pdf/1907.10525v4",
   "sha256": "6eb02c16c525360141b1c5d118ae04db070f3c0e9cb9fff0f1598fc889b50aec",
   "readSections": [
    "cc-48533a, 2026-09-29: §4.5 introduction, Propositions 4.5.1 and 4.5.2 with proofs, Lemma 4.5.3, pp. 53–55; bibliography entries [6] (Berthelot–Breen–Messing, LNM 930) and [7]"
   ],
   "accessed": "2026-09-29"
  },
  {
   "id": "kurama-fourier-mukai",
   "title": "Fourier–Mukai partners of abelian varieties and K3 surfaces in positive and mixed characteristics",
   "authors": "Riku Kurama",
   "edition": "arXiv:2410.14065v2 (17 February 2026)",
   "url": "https://arxiv.org/pdf/2410.14065v2",
   "sha256": "e7942fbce1f3bcad84e32f533c96797db2db6a461803616b2997417fe340138f",
   "readSections": [
    "cc-48533a, 2026-09-29: §4.1 Relative de Rham cohomology of abelian schemes: Lemma 4.1 (its statement of Berthelot–Breen–Messing, Proposition 2.5.2), Proposition 4.2, Lemmas 4.3 and 4.4 with proofs, pp. 8–10"
   ],
   "accessed": "2026-09-29"
  },
  {
   "id": "stacks-de-rham",
   "title": "The Stacks Project, Chapter 0FK4: de Rham Cohomology",
   "authors": "The Stacks Project Authors",
   "edition": "Chapter PDF as served on 2026-09-29",
   "url": "https://stacks.math.columbia.edu/download/derham.pdf",
   "sha256": "d1dc49a3e49b26b2b205f1ca87c36d1a79829fbf98be4eeab4665924005d1c42",
   "readSections": [
    "cc-48533a, 2026-09-29: Sections 2–8: Lemma 3.5 (Tag 0FM0) with proof, Section 4 (Tags 0FM1–0FM3), Section 5 (Tags 0FM4–0FM5), Section 6 (Tag 0FM6), Section 7 (Tags 0FM7–0FM8), Section 8 (Tags 0FM9–0FMC)"
   ],
   "accessed": "2026-09-29"
  },
  {
   "id": "stacks-derived-categories-of-schemes",
   "title": "The Stacks Project, Chapter 08DP: Derived Categories of Schemes",
   "authors": "The Stacks Project Authors",
   "edition": "Chapter PDF as served on 2026-09-29",
   "url": "https://stacks.math.columbia.edu/download/perfect.pdf",
   "sha256": "f79e0ebb628734948a51efd20b75d75c8e5341e4ab493e54f7fc710ebf72fb02",
   "readSections": [
    "cc-48533a, 2026-09-29: Lemma 22.1 (Tag 08EU, projection formula), Lemma 23.1 (Tag 0FLQ, Künneth), Lemmas 32.5–32.6 (Tags 0E62, 0E0L) with proofs"
   ],
   "accessed": "2026-09-29"
  },
  {
   "id": "stacks-0A1U",
   "title": "The Stacks Project, Lemma 15.78.2 (Tag 0A1U)",
   "authors": "The Stacks Project Authors",
   "edition": "Online, Chapter 15 (More on Algebra), Section 15.78 (Splitting complexes); page as served on 2026-09-29",
   "url": "https://stacks.math.columbia.edu/tag/0A1U",
   "sha256": "ae3cf4f206e4241e066301273cd3ee14521a6bdf8574af803dc7f072dadcce63",
   "readSections": [
    "cc-48533a, 2026-09-29: Lemma 15.78.2, statement"
   ],
   "accessed": "2026-09-29"
  },
  {
   "id": "hatcher-algebraic-topology",
   "title": "Algebraic Topology",
   "authors": "Allen Hatcher",
   "edition": "Cambridge University Press (2002), the author's online edition",
   "url": "https://pi.math.cornell.edu/~hatcher/AT/AT.pdf",
   "sha256": "bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618",
   "readSections": [
    "cc-48533a, 2026-09-29: §3.C, pp. 283–285: primitive elements, Examples 3C.2–3C.3, Theorem 3C.4 (Hopf) and the statement of Borel's theorem"
   ],
   "accessed": "2026-09-29"
  }
 ],
 "sources[milne-abelian-varieties].readSections (append)": [
  "cc-48533a, 2026-09-29: §12 The étale cohomology of an abelian variety, pp. 54–56: Theorem 12.1, the coproduct identity (3), Lemma 12.2 with proof, Remarks 12.3–12.5"
 ],
 "sourceVersions (append)": [
  {
   "kind": "preprint",
   "url": "https://arxiv.org/pdf/1907.10525v4",
   "citation": "Anschütz–Le Bras, Prismatic Dieudonné theory, arXiv v4 (the Forum of Mathematics, Pi version was not read)",
   "read": "2026-09-29",
   "sha256": "6eb02c16c525360141b1c5d118ae04db070f3c0e9cb9fff0f1598fc889b50aec"
  },
  {
   "kind": "preprint",
   "url": "https://arxiv.org/pdf/2410.14065v2",
   "citation": "Kurama, Fourier–Mukai partners of abelian varieties and K3 surfaces in positive and mixed characteristics, arXiv v2",
   "read": "2026-09-29",
   "sha256": "e7942fbce1f3bcad84e32f533c96797db2db6a461803616b2997417fe340138f"
  },
  {
   "kind": "published",
   "url": "https://stacks.math.columbia.edu/download/derham.pdf",
   "citation": "Stacks Project, Chapter 0FK4",
   "read": "2026-09-29",
   "sha256": "d1dc49a3e49b26b2b205f1ca87c36d1a79829fbf98be4eeab4665924005d1c42"
  },
  {
   "kind": "published",
   "url": "https://stacks.math.columbia.edu/download/perfect.pdf",
   "citation": "Stacks Project, Chapter 08DP",
   "read": "2026-09-29",
   "sha256": "f79e0ebb628734948a51efd20b75d75c8e5341e4ab493e54f7fc710ebf72fb02"
  },
  {
   "kind": "published",
   "url": "https://stacks.math.columbia.edu/tag/0A1U",
   "citation": "Stacks Project Tag 0A1U",
   "read": "2026-09-29",
   "sha256": "ae3cf4f206e4241e066301273cd3ee14521a6bdf8574af803dc7f072dadcce63"
  },
  {
   "kind": "author copy",
   "url": "https://pi.math.cornell.edu/~hatcher/AT/AT.pdf",
   "citation": "Hatcher, Algebraic Topology, online edition",
   "read": "2026-09-29",
   "sha256": "bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618"
  }
 ],
 "nodes (append)": [
  {
   "id": "AbelianSchemesAndArithmeticModuli:A4/hopf-algebra-exterior-criterion",
   "parentStageId": "AbelianSchemesAndArithmeticModuli:A4",
   "realises": [],
   "title": "A graded Hopf algebra with top degree d and dim H¹ = d is the exterior algebra on H¹",
   "kind": "lemma",
   "statement": "Let K be a perfect field and H = ⊕_{r≥0} H^r a graded, associative, graded-commutative K-algebra with H^0 = K, every H^r finite-dimensional and H^r = 0 for r > d. Let m* : H → H ⊗_K H be a homomorphism of graded K-algebras (Koszul sign rule on H ⊗_K H) such that every x of positive degree satisfies m*(x) = x ⊗ 1 + 1 ⊗ x + Σ x_i ⊗ y_i with deg x_i > 0 and deg y_i > 0. Then dim_K H^1 ≤ d. If dim_K H^1 = d, then x·x = 0 for every x ∈ H^1, and the K-algebra map ∧^•_K H^1 → H extending H^1 ⊆ H is an isomorphism of graded K-algebras.",
   "hypotheses": [
    "Graded-commutative means xy = (−1)^{deg x · deg y} yx. In characteristic 2 this is commutativity, and x·x = 0 for x ∈ H^1 is part of the conclusion, not a hypothesis.",
    "Milne states the lemma over a perfect field because the proof uses Borel's structure theorem. Over an arbitrary field k it is applied after base change to the perfect closure, which is faithfully flat, so the dimension count and the isomorphism descend to k.",
    "Only the displayed shape of m* is used: no coassociativity, counit or antipode."
   ],
   "proofSteps": [
    "Borel's structure theorem (Borel 1953; Hatcher §3.C states it for finite fields and proves the characteristic-zero case, Theorem 3C.4): H is generated as a K-algebra by elements x_i subject only to graded commutativity and relations x_i^{h_i} = 0, with h_i a power of char K, or h_i = 2 for x_i of odd degree when char K ≠ 2. This step is the recorded gap on Borel's theorem.",
    "The product ∏ x_i^{h_i − 1} is nonzero, of degree Σ deg(x_i)(h_i − 1), so Σ deg(x_i)(h_i − 1) ≤ d.",
    "Products of elements of positive degree have degree at least 2, so the generators of degree 1 form a basis of H^1. Hence dim H^1 ≤ Σ deg(x_i)(h_i − 1) ≤ d.",
    "If dim H^1 = d, both inequalities are equalities: every generator has degree 1 and h_i = 2, so x_i² = 0. Then H = ⊗_i K[x_i]/(x_i²), which is ∧^•H^1; the map is ExteriorAlgebra.lift applied to H^1 ⊆ H."
   ],
   "acceptance": [
    "H = ∧^•K^d with every basis vector primitive: dim H^1 = d, and the lemma returns H.",
    "H = F_p[x]/(x^p) with deg x = 2 (a Hopf algebra with x primitive, Hatcher Example 3C.3): H^1 = 0 and the top degree is 2(p − 1), so the inequality is strict and H is not exterior on H^1. The equality hypothesis cannot be dropped.",
    "H = F_2[x]/(x⁴) with deg x = 1 and x primitive (a Hopf algebra by Hatcher Example 3C.3 with n = 4): d = 3 > 1 = dim H^1 and x² ≠ 0. Alternation is a consequence of the equality dim H^1 = d, not of graded commutativity."
   ],
   "prerequisites": [
    "mathlib:ExteriorAlgebra",
    "mathlib:ExteriorAlgebra.lift"
   ],
   "sources": [
    {
     "sourceId": "milne-abelian-varieties",
     "locator": "§12, Lemma 12.2, p. 55",
     "excerpt": "is canonically isomorphic to the exterior algebra on",
     "match": "The lemma as stated, over a perfect field, with the coproduct identity (3) as hypothesis."
    },
    {
     "sourceId": "milne-abelian-varieties",
     "locator": "§12, proof of Lemma 12.2, p. 55",
     "excerpt": "A fundamental structure theorem for Hopf algebras (Borel 1953) shows that",
     "match": "Steps 1–4: Borel's theorem and the degree count."
    },
    {
     "sourceId": "hatcher-algebraic-topology",
     "locator": "§3.C, after Theorem 3C.4, p. 285",
     "excerpt": "There is an analogous theorem of Borel when F is a finite field of characteris-",
     "match": "Borel's structure theorem, stated without proof and only for finite fields."
    },
    {
     "sourceId": "hatcher-algebraic-topology",
     "locator": "§3.C, Example 3C.3, p. 284",
     "excerpt": "Suppose that the truncated polynomial algebra F [α]/(αn ) over a field",
     "match": "The truncated polynomial Hopf algebras used in the acceptance tests."
    }
   ],
   "implementationStatus": "unchecked"
  },
  {
   "id": "AbelianSchemesAndArithmeticModuli:A4/cohomology-of-the-structure-sheaf",
   "parentStageId": "AbelianSchemesAndArithmeticModuli:A4",
   "realises": [],
   "title": "R^•f_*𝒪_A is the exterior algebra on R¹f_*𝒪_A, locally free and compatible with base change",
   "kind": "theorem",
   "statement": "Let f : A → S be an abelian scheme of constant relative dimension g over a scheme S (a proper smooth group scheme with geometrically connected fibres, A1's carrier), with unit section e and ω_{A/S} = e^*Ω^1_{A/S}. 'Commutes with base change' means: for every morphism u : S′ → S, with f′ : A′ = A ×_S S′ → S′, the base-change map u^*R^if_*(−) → R^if′_*(−) is an isomorphism. Then: (a) for every i ≥ 0 the O_S-module R^if_*O_A is finite locally free of rank C(g, i), and its formation commutes with arbitrary base change; in particular R^if_*O_A = 0 for i > g. (b) Every local section x of R^1f_*O_A satisfies x ∪ x = 0, and the cup product induces an isomorphism of graded O_S-algebras ∧^•_{O_S} R^1f_*O_A → ⊕_{i≥0} R^if_*O_A. Over S = Spec k: dim_k H^i(A, O_A) = C(g, i) and H^•(A, O_A) = ∧^•H^1(A, O_A).",
   "hypotheses": [
    "Over a field this is Mumford, Abelian Varieties, §13, Corollary 2, which was not read; Kurama quotes it in the proof of his Lemma 4.4.",
    "The relative statement is about the sheaves R^if_*O_A on S, not the global modules H^i(A, O_A): over a nonaffine base the two differ.",
    "Base change is along arbitrary morphisms S′ → S, not only flat ones."
   ],
   "proofSteps": [
    "Field case, k perfect. H = H^•(A, O_A) is associative and graded commutative under the cup product (Stacks 0FM5, bidegrees (0, q)). The Künneth isomorphism H^•(A ×_k A, O) ≅ H ⊗_k H (Stacks 0FLQ) and the addition m : A × A → A give m* : H → H ⊗ H. Restricting along a ↦ (a, e) and a ↦ (e, a) shows that m* has the shape required by A4/hopf-algebra-exterior-criterion; Milne's derivation of his identity (3) is formal and applies verbatim to coherent cohomology.",
    "H^r(A, O_A) = 0 for r > g, since A is a noetherian scheme of dimension g (Grothendieck vanishing, requested from SchemeAndStackFoundations SF.2).",
    "dim_k H^1(A, O_A) ≥ g: H^1(A, O_A) is the tangent space at the origin of Pic_{A/k}, which contains the dual abelian variety A^∨ = Pic^0_{A/k} of dimension g (A2).",
    "A4/hopf-algebra-exterior-criterion with d = g gives dim H^1 = g and ∧^•H^1 ≅ H, so dim H^i = C(g, i) (exteriorPower.finrank_eq). For an imperfect field pass to the perfect closure: Rf_*O_A commutes with base change (Stacks 0FM0, the case p = 0).",
    "Relative case. Rf_*O_A is a perfect complex whose formation commutes with arbitrary base change (Stacks 0FM0, p = 0; JacobianChallenge Layer C).",
    "R^1f_*O_A ≅ Lie(A^∨) is finite locally free of rank g and its formation commutes with base change (A2: the dual abelian scheme is smooth of relative dimension g, and its Lie algebra is the tangent space of Pic_{A/S} along the unit section).",
    "For s ∈ S and every i, the composite (R^1f_*O_A)^{⊗i} ⊗ κ(s) → R^if_*O_A ⊗ κ(s) → H^i(A_s, O) is surjective by the two previous steps and the field case. So every base-change map R^if_*O_A ⊗ κ(s) → H^i(A_s, O) is surjective. Stacks 0A1U, applied on affine opens to Rf_*O_A for each i in [0, g] in turn, splits Rf_*O_A locally as ⊕_i R^if_*O_A[−i], each summand perfect of tor amplitude [i, i]. Hence each R^if_*O_A is finite locally free, commutes with base change, and has rank dim H^i(A_s, O) = C(g, i). This is (a).",
    "Alternation. By Künneth over S (Stacks 0FLQ, A flat over S) and (a), R^•(f × f)_*O ≅ R^•f_*O ⊗ R^•f_*O, and every local section x of R^1f_*O_A is primitive: m*x = x ⊗ 1 + 1 ⊗ x. Hence m*(x²) = x² ⊗ 1 + 1 ⊗ x², since (1 ⊗ x)(x ⊗ 1) = −x ⊗ x in odd degree (Hatcher, Example 3C.2).",
    "Locally choose a basis x_1, …, x_g of R^1f_*O_A. The products x_jx_k with j < k generate R^2f_*O_A on every fibre (field case), hence generate it (Nakayama), and they are C(g, 2) = rank R^2f_*O_A in number, so they form a basis. Write x² = Σ_{j<k} c_{jk}x_jx_k. The (1, 1)-Künneth component of m*(x²) is Σ c_{jk}(x_j ⊗ x_k − x_k ⊗ x_j), which vanishes because x² is primitive; the x_a ⊗ x_b form a basis of R^1f_*O ⊗ R^1f_*O, so every c_{jk} = 0 and x² = 0.",
    "So the cup product factors through ExteriorAlgebra.lift: ∧^•R^1f_*O_A → R^•f_*O_A. It is surjective on every fibre (field case), hence surjective (Nakayama), and a surjection of finite locally free modules of the same rank C(g, i) is an isomorphism. This is (b)."
   ],
   "acceptance": [
    "g = 1, an elliptic curve E → S: R^1f_*O_E is invertible, dual to ω_{E/S}, and R^if_*O_E = 0 for i ≥ 2.",
    "S = Spec k: dim_k H^i(A, O_A) = C(g, i), the value Kurama quotes from Mumford §13, Corollary 2.",
    "A product E_1 ×_S E_2 of elliptic curves: R^•f_*O = R^•O_{E_1} ⊗ R^•O_{E_2} by Künneth, of ranks 1, 2, 1."
   ],
   "prerequisites": [
    "AbelianSchemesAndArithmeticModuli:A4/hopf-algebra-exterior-criterion",
    "AbelianSchemesAndArithmeticModuli:A1",
    "AbelianSchemesAndArithmeticModuli:A2",
    "SchemeAndStackFoundations:SF.2",
    "tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology",
    "mathlib:ExteriorAlgebra.lift",
    "mathlib:exteriorPower.finrank_eq"
   ],
   "sources": [
    {
     "sourceId": "kurama-fourier-mukai",
     "locator": "proof of Lemma 4.4, p. 10",
     "excerpt": "where the last equality used [Mum70, §13 Corollary 2]",
     "match": "dim H^i(A, O_A) = C(g, i) over a field, quoted from Mumford."
    },
    {
     "sourceId": "anschutz-lebras-prismatic-dieudonne",
     "locator": "Proposition 4.5.1, p. 53",
     "excerpt": "is finite locally free, and its formation commutes with base",
     "match": "The case j = 0 of the Hodge statement, over Ā = A/I for a bounded prism."
    },
    {
     "sourceId": "milne-abelian-varieties",
     "locator": "§12, identity (3), p. 55",
     "excerpt": "As the same remark applies",
     "match": "The derivation of the coproduct shape from the addition map and the two unit sections."
    },
    {
     "sourceId": "stacks-0A1U",
     "locator": "Lemma 15.78.2",
     "excerpt": "be a pseudo-coherent complex of",
     "match": "The splitting criterion that turns surjective base-change maps into local freeness."
    },
    {
     "sourceId": "stacks-derived-categories-of-schemes",
     "locator": "Lemma 23.1 (Tag 0FLQ), p. 54",
     "excerpt": "separated and X and Y are tor-independent over S, then (23.0.1) is an isomorphism",
     "match": "The Künneth isomorphism over S used for m*."
    }
   ],
   "implementationStatus": "unchecked"
  },
  {
   "id": "AbelianSchemesAndArithmeticModuli:A4/hodge-cohomology-of-an-abelian-scheme",
   "parentStageId": "AbelianSchemesAndArithmeticModuli:A4",
   "realises": [],
   "title": "Hodge cohomology of an abelian scheme: R^if_*Ω^j ≅ R^if_*𝒪 ⊗ ∧^jω",
   "kind": "theorem",
   "statement": "Let f : A → S be an abelian scheme of constant relative dimension g over a scheme S (a proper smooth group scheme with geometrically connected fibres, A1's carrier), with unit section e and ω_{A/S} = e^*Ω^1_{A/S}. 'Commutes with base change' means: for every morphism u : S′ → S, with f′ : A′ = A ×_S S′ → S′, the base-change map u^*R^if_*(−) → R^if′_*(−) is an isomorphism. For all i, j ≥ 0 the canonical map R^if_*O_A ⊗_{O_S} ∧^jω_{A/S} → R^if_*Ω^j_{A/S} is an isomorphism. Hence R^if_*Ω^j_{A/S} is finite locally free of rank C(g, i)·C(g, j) and its formation commutes with arbitrary base change, and the Hodge cohomology ⊕_{i,j} R^if_*Ω^j_{A/S} is, as a bigraded O_S-algebra under cup product, the graded-commutative tensor product ∧^•R^1f_*O_A ⊗ ∧^•ω_{A/S}.",
   "hypotheses": [
    "The isomorphism Ω^1_{A/S} ≅ f^*ω_{A/S} is the translation invariance of differentials on a group scheme (A1): it uses the group structure, not only smoothness.",
    "Ranks are constant because the relative dimension is; over a base where it is only locally constant, apply the statement on each open and closed piece."
   ],
   "proofSteps": [
    "Ω^1_{A/S} ≅ f^*ω_{A/S} (A1), hence Ω^j_{A/S} ≅ f^*∧^jω_{A/S} for every j, with ω_{A/S} finite locally free of rank g.",
    "Projection formula (Stacks 08EU): Rf_*(f^*∧^jω) ≅ Rf_*O_A ⊗^L ∧^jω; since ∧^jω is finite locally free, R^if_*Ω^j ≅ R^if_*O_A ⊗ ∧^jω.",
    "A4/cohomology-of-the-structure-sheaf gives R^if_*O_A finite locally free of rank C(g, i), commuting with base change; ∧^jω has rank C(g, j) and commutes with base change because e^* does. So R^if_*Ω^j is finite locally free of rank C(g, i)C(g, j) and commutes with base change.",
    "Under the isomorphism of step 2 the cup product on Hodge cohomology (Stacks 0FM5) is the tensor product of the cup product on R^•f_*O_A, which is A4/cohomology-of-the-structure-sheaf(b), and the wedge product on ∧^•ω."
   ],
   "acceptance": [
    "g = 1: f_*Ω^1 = ω and R^1f_*Ω^1 ≅ R^1f_*O ⊗ ω ≅ O_S; the four Hodge numbers h^{0,0}, h^{1,0}, h^{0,1}, h^{1,1} are 1.",
    "Σ_{i+j=n} C(g, i)C(g, j) = C(2g, n) (Nat.add_choose_eq with m = n = g): the bound that A4/hodge-to-de-rham-degeneration uses.",
    "[n]^* acts on R^if_*Ω^j by n^{i+j} (by n on ω and on R^1f_*O_A = Lie(A^∨)); Anschütz–Le Bras use this action for p ≠ 2 in the proof of their Proposition 4.5.2."
   ],
   "prerequisites": [
    "AbelianSchemesAndArithmeticModuli:A4/cohomology-of-the-structure-sheaf",
    "AbelianSchemesAndArithmeticModuli:A1",
    "mathlib:Nat.add_choose_eq"
   ],
   "sources": [
    {
     "sourceId": "anschutz-lebras-prismatic-dieudonne",
     "locator": "Proposition 4.5.1, p. 53",
     "excerpt": "is finite locally free, and its formation commutes with base",
     "match": "The Hodge statement over Ā = A/I for a bounded prism."
    },
    {
     "sourceId": "kurama-fourier-mukai",
     "locator": "Lemma 4.1(3), p. 8",
     "excerpt": "are locally free and their forma-",
     "match": "The Hodge sheaves are locally free and commute with base change, over a locally noetherian base."
    },
    {
     "sourceId": "stacks-derived-categories-of-schemes",
     "locator": "Lemma 22.1 (Tag 08EU), p. 51",
     "excerpt": "of schemes. For E in DQCoh (OX ) and K in DQCoh (OY ) the map",
     "match": "The projection formula of step 2."
    }
   ],
   "implementationStatus": "unchecked"
  },
  {
   "id": "AbelianSchemesAndArithmeticModuli:A4/hodge-to-de-rham-degeneration",
   "parentStageId": "AbelianSchemesAndArithmeticModuli:A4",
   "realises": [],
   "title": "H^n_dR(A/S) is locally free of rank C(2g, n), commutes with base change, and Hodge–de Rham degenerates",
   "kind": "theorem",
   "statement": "Let f : A → S be an abelian scheme of constant relative dimension g over a scheme S (a proper smooth group scheme with geometrically connected fibres, A1's carrier), with unit section e and ω_{A/S} = e^*Ω^1_{A/S}. 'Commutes with base change' means: for every morphism u : S′ → S, with f′ : A′ = A ×_S S′ → S′, the base-change map u^*R^if_*(−) → R^if′_*(−) is an isomorphism. Let H^n_dR(A/S) = R^nf_*Ω^•_{A/S}. Then for every n: (a) H^n_dR(A/S) is finite locally free of rank C(2g, n) and its formation commutes with arbitrary base change; (b) the Hodge-to-de Rham spectral sequence E_1^{p,q} = R^qf_*Ω^p_{A/S} ⇒ H^{p+q}_dR(A/S) degenerates at E_1: for every p the map R^nf_*σ_{≥p}Ω^•_{A/S} → H^n_dR(A/S) is injective, its image F^pH^n_dR(A/S) is a local direct summand, F^p/F^{p+1} ≅ R^{n−p}f_*Ω^p_{A/S}, and R^nf_*σ_{≥p}Ω^• and the Hodge filtration commute with arbitrary base change.",
   "hypotheses": [
    "In degree one this is A4's H^1_dR with its Hodge exact sequence 0 → f_*Ω^1 → H^1_dR → R^1f_*O_A → 0, which the node imports and extends to all degrees.",
    "H^n_dR(A/S) is the hypercohomology sheaf R^nf_*Ω^•: the de Rham differentials are f^{-1}O_S-linear, not O_A-linear.",
    "The original source is Berthelot–Breen–Messing, Théorie de Dieudonné cristalline II, Proposition 2.5.2, which was not read. Kurama states it over a locally noetherian base, and Anschütz–Le Bras over Ā = A/I for a bounded prism. The proof below works over an arbitrary base and does not rely on the unread text."
   ],
   "proofSteps": [
    "Upper bound on fibres. Over a field k, the spectral sequence (Stacks 0FM6) gives dim H^n_dR(A/k) ≤ Σ_{p+q=n} dim H^q(A, Ω^p) = Σ_{p+q=n} C(g, q)C(g, p) = C(2g, n) (A4/hodge-cohomology-of-an-abelian-scheme, Nat.add_choose_eq), with equality for every n if and only if it degenerates at E_1. In particular H^n_dR(A/k) = 0 for n > 2g.",
    "Field case, k perfect. H^•_dR(A/k) is associative and graded commutative (Stacks 0FM3); the Künneth map H^•_dR(A/k) ⊗ H^•_dR(A/k) → H^•_dR(A × A/k) is an isomorphism (Stacks 0FMC); the addition map gives m* of the shape required by A4/hopf-algebra-exterior-criterion; and dim H^1_dR(A/k) = 2g (A4, degree one). The lemma with d = 2g gives H^•_dR(A/k) = ∧^•H^1_dR(A/k), so dim H^n_dR = C(2g, n): the bound of step 1 is attained and the spectral sequence degenerates. For an imperfect field pass to the perfect closure (Stacks 0FM0).",
    "Relative local freeness. Rf_*Ω^• is perfect and commutes with arbitrary base change (Stacks 0FM0). H^1_dR(A/S) is finite locally free of rank 2g and commutes with base change (A4). For s ∈ S and every n, the composite H^1_dR(A/S)^{⊗n} ⊗ κ(s) → H^n_dR(A/S) ⊗ κ(s) → H^n_dR(A_s/κ(s)) is surjective by step 2, so every base-change map is surjective. Stacks 0A1U, applied for each n in [0, 2g] on affine opens, splits Rf_*Ω^• locally into ⊕_n H^n_dR[−n], each H^n_dR finite locally free of rank C(2g, n) and commuting with base change. This is (a).",
    "Filtration pieces. Locally choose a basis x_1, …, x_{2g} of H^1_dR(A/S) with x_1, …, x_g a basis of f_*Ω^1 = F^1H^1_dR (A4's Hodge exact sequence). The wedge product sends σ_{≥a} ⊗ σ_{≥b} into σ_{≥a+b} (Stacks 0FM8 and the diagram after it), so every product x_I = x_{i_1} ⋯ x_{i_n} (i_1 < ⋯ < i_n) with at least p indices in {1, …, g} lifts to R^nf_*σ_{≥p}Ω^•. On a fibre their images span F^pH^n_dR(A_s): by step 2 they are part of the basis {x_I}, and their number Σ_{p′≥p} C(g, p′)C(g, n − p′) is dim F^p by degeneration. Since R f_*σ_{≥p}Ω^• is perfect and commutes with base change (the induction in the proof of Stacks 0FM0) and H^n(A_s, σ_{≥p}) → H^n_dR(A_s) is injective (fibre degeneration), the base-change maps of Rf_*σ_{≥p}Ω^• are surjective, and Stacks 0A1U makes each R^nf_*σ_{≥p}Ω^• finite locally free and compatible with base change.",
    "Degeneration over S. R^nf_*σ_{≥p}Ω^• → H^n_dR(A/S) is a map of finite locally free modules, injective on every fibre; over a local ring such a map is split injective (lift a basis; Nakayama), so its image F^p is a local direct summand. Hence in the long exact sequence of σ_{≥p+1} → σ_{≥p} → Ω^p[−p] every map R^{n+1}f_*σ_{≥p+1} → R^{n+1}f_*σ_{≥p} is injective, the connecting maps vanish, and F^p/F^{p+1} ≅ R^{n−p}f_*Ω^p. This is (b)."
   ],
   "acceptance": [
    "g = 1: H^1_dR(E/S) is locally free of rank 2 with Hodge filtration 0 → ω → H^1_dR → ω^∨ → 0, and H^2_dR(E/S) ≅ R^1f_*Ω^1 ≅ O_S.",
    "A product E_1 × E_2 of elliptic curves: H^2_dR has rank 6 = C(4, 2), with graded pieces of ranks 1, 4, 1.",
    "The total rank Σ_n rank H^n_dR(A/S) is 2^{2g}."
   ],
   "prerequisites": [
    "AbelianSchemesAndArithmeticModuli:A4/hodge-cohomology-of-an-abelian-scheme",
    "AbelianSchemesAndArithmeticModuli:A4/hopf-algebra-exterior-criterion",
    "AbelianSchemesAndArithmeticModuli:A4",
    "DerivedDeRhamCohomology:DD.2",
    "mathlib:Nat.add_choose_eq"
   ],
   "sources": [
    {
     "sourceId": "kurama-fourier-mukai",
     "locator": "Lemma 4.1, p. 8",
     "excerpt": "Let A be an abelian scheme over a locally noetherian scheme S",
     "match": "Berthelot–Breen–Messing 2.5.2 as Kurama states it: cup-product isomorphisms, E_1-degeneration, local freeness and base change."
    },
    {
     "sourceId": "kurama-fourier-mukai",
     "locator": "Lemma 4.3 and its proof, p. 9",
     "excerpt": "are compatible with (underived) base change",
     "match": "The Hodge filtration pieces are locally free, inject into H^n_dR and commute with base change."
    },
    {
     "sourceId": "anschutz-lebras-prismatic-dieudonne",
     "locator": "Proposition 4.5.1, p. 53",
     "excerpt": "is finite locally free, and its formation commutes with base",
     "match": "The de Rham statement over Ā = A/I for a bounded prism."
    },
    {
     "sourceId": "stacks-de-rham",
     "locator": "Lemma 3.5 (Tag 0FM0), p. 3",
     "excerpt": "Let f : X → S be a proper smooth morphism of schemes. Then",
     "match": "Perfectness and base change of Rf_*Ω^• and Rf_*σ_{≥p}Ω^•."
    },
    {
     "sourceId": "stacks-0A1U",
     "locator": "Lemma 15.78.2",
     "excerpt": "be a pseudo-coherent complex of",
     "match": "The splitting criterion of steps 3 and 4."
    }
   ],
   "implementationStatus": "unchecked"
  },
  {
   "id": "AbelianSchemesAndArithmeticModuli:A4/de-rham-cohomology-is-an-exterior-algebra",
   "parentStageId": "AbelianSchemesAndArithmeticModuli:A4",
   "realises": [],
   "title": "H^•_dR(A/S) is the exterior algebra on H¹_dR(A/S), as a filtered algebra",
   "kind": "theorem",
   "statement": "Let f : A → S be an abelian scheme of constant relative dimension g over a scheme S (a proper smooth group scheme with geometrically connected fibres, A1's carrier), with unit section e and ω_{A/S} = e^*Ω^1_{A/S}. 'Commutes with base change' means: for every morphism u : S′ → S, with f′ : A′ = A ×_S S′ → S′, the base-change map u^*R^if_*(−) → R^if′_*(−) is an isomorphism. The cup product on H^•_dR(A/S) = ⊕_n H^n_dR(A/S) is alternating in degree one: x ∪ x = 0 for every local section x of H^1_dR(A/S). The induced homomorphism of graded O_S-algebras ∧^•_{O_S}H^1_dR(A/S) → H^•_dR(A/S) is an isomorphism and commutes with base change. It is an isomorphism of filtered modules when ∧^nH^1_dR carries the filtration F^k = Σ_{i_1+⋯+i_n = k} F^{i_1} ∧ ⋯ ∧ F^{i_n} induced by the Hodge filtration of H^1_dR.",
   "hypotheses": [
    "In characteristic 2 alternation does not follow from graded commutativity; it is proved from the group law.",
    "Over a nonreduced base a section of a locally free module that vanishes on every fibre need not vanish, so the relative alternation is not a consequence of the field case alone."
   ],
   "proofSteps": [
    "Primitivity. By Künneth over S (Stacks 0FMC) and A4/hodge-to-de-rham-degeneration(a), H^•_dR(A ×_S A/S) ≅ H^•_dR(A/S) ⊗ H^•_dR(A/S). For a local section x of H^1_dR, restricting m*x along a ↦ (a, e) and a ↦ (e, a) gives m*x = x ⊗ 1 + 1 ⊗ x.",
    "Then m*(x²) = x² ⊗ 1 + 1 ⊗ x², since (1 ⊗ x)(x ⊗ 1) = −x ⊗ x in odd degree (Hatcher, Example 3C.2).",
    "Locally choose a basis x_1, …, x_{2g} of H^1_dR(A/S). The products x_jx_k with j < k generate H^2_dR(A/S) on every fibre (the field case of A4/hodge-to-de-rham-degeneration), hence generate it (Nakayama); there are C(2g, 2) = rank H^2_dR of them, so they form a basis. Write x² = Σ_{j<k} c_{jk}x_jx_k. The (1, 1)-Künneth component of m*(x²) is Σ c_{jk}(x_j ⊗ x_k − x_k ⊗ x_j), which is zero by the previous step; since the x_a ⊗ x_b form a basis of H^1_dR ⊗ H^1_dR, every c_{jk} = 0 and x² = 0.",
    "The cup product therefore factors through ExteriorAlgebra.lift. The map ∧^nH^1_dR → H^n_dR is surjective on every fibre (field case), hence surjective, and is a surjection of finite locally free modules of the same rank C(2g, n) (exteriorPower.finrank_eq), hence an isomorphism. Both sides commute with base change (A4/hodge-to-de-rham-degeneration(a)).",
    "Filtration. The cup product respects the Hodge filtration (Stacks 0FM8), so the isomorphism is filtered. It induces a surjection on each filtered piece: on fibres by the dimension count of Kurama's Lemma 4.4, and in general by the base-change compatibility of the Hodge filtration (A4/hodge-to-de-rham-degeneration(b)) and Nakayama, as in Kurama's Proposition 4.2. So it is a filtered isomorphism."
   ],
   "acceptance": [
    "g = 1: ∧^2H^1_dR(E/S) ≅ H^2_dR(E/S) ≅ O_S, the cup-product pairing on H^1_dR of an elliptic curve being perfect.",
    "A product E_1 × E_2 of elliptic curves: H^1_dR = H^1_dR(E_1) ⊕ H^1_dR(E_2), and ∧^2 of it has rank 6 = rank H^2_dR, matching the Künneth decomposition into ranks 1 + 4 + 1.",
    "Over F_2: x ∪ x = 0 for every x ∈ H^1_dR(A/F_2), although graded commutativity only gives 2(x ∪ x) = 0."
   ],
   "prerequisites": [
    "AbelianSchemesAndArithmeticModuli:A4/hodge-to-de-rham-degeneration",
    "AbelianSchemesAndArithmeticModuli:A4/hopf-algebra-exterior-criterion",
    "AbelianSchemesAndArithmeticModuli:A4",
    "DerivedDeRhamCohomology:DD.2",
    "mathlib:ExteriorAlgebra.lift",
    "mathlib:exteriorPower.finrank_eq"
   ],
   "sources": [
    {
     "sourceId": "anschutz-lebras-prismatic-dieudonne",
     "locator": "Proposition 4.5.1, p. 53",
     "excerpt": "defined by the multiplicative structure of",
     "match": "Alternation and the exterior-algebra isomorphism over Ā = A/I for a bounded prism."
    },
    {
     "sourceId": "kurama-fourier-mukai",
     "locator": "Proposition 4.2 and its proof, p. 9",
     "excerpt": "It suffices to show that this induces a surjective map on each filtered piece.",
     "match": "The filtered isomorphism, by Lemma 4.4, base change of the Hodge filtration and Nakayama."
    },
    {
     "sourceId": "hatcher-algebraic-topology",
     "locator": "§3.C, Example 3C.2, p. 284",
     "excerpt": "must check that ∆(α2 ) = ∆(α)2 , or in other words, since α2 = 0 , we need to see",
     "match": "The square of an odd primitive element is primitive."
    },
    {
     "sourceId": "stacks-de-rham",
     "locator": "Lemma 8.3 (Tag 0FMC), p. 9",
     "excerpt": "is an isomorphism in D(OS ).",
     "match": "The relative Künneth isomorphism of step 1."
    }
   ],
   "planet": {
    "name": "de Rham cohomology of an abelian scheme"
   },
   "implementationStatus": "unchecked"
  },
  {
   "id": "AbelianSchemesAndArithmeticModuli:A4/de-rham-cohomology-of-the-p-adic-completion",
   "parentStageId": "AbelianSchemesAndArithmeticModuli:A4",
   "realises": [],
   "title": "The same statements for the p-adic completion over a p-adically complete base",
   "kind": "lemma",
   "statement": "Let p be a prime and Ā a ring that is p-adically complete with bounded p^∞-torsion, for example Ā = A/I for a bounded prism (A, I). Let f : A → Spec Ā be an abelian scheme, X → Spf Ā its p-adic completion and Ω^j_{X/Ā} the p-adically completed differentials. Then for all k, i, j the maps H^k(A, Ω^•_{A/Ā}) → H^k(X, Ω^•_{X/Ā}) and H^i(A, Ω^j_{A/Ā}) → H^i(X, Ω^j_{X/Ā}) are isomorphisms. Consequently H^k(X, Ω^•_{X/Ā}) and H^i(X, Ω^j_{X/Ā}) are finite locally free Ā-modules whose formation commutes with base change along maps Ā → Ā′ of such rings, H^•(X, Ω^•_{X/Ā}) is alternating, and ∧^•H^1(X, Ω^•_{X/Ā}) → H^•(X, Ω^•_{X/Ā}) is an isomorphism: Anschütz–Le Bras, Proposition 4.5.1.",
   "hypotheses": [
    "This is the form in which the prismatic Dieudonné theory consumes the theorem (PAPER-ANSCHUTZ-LEBRAS-23, item /97). Anschütz–Le Bras deduce it from Berthelot–Breen–Messing 2.5.2 without comment on the passage from A to its completion; this node supplies that passage.",
    "Bounded p^∞-torsion is what identifies the limit over the ordinary quotients Ā/p^n with the derived p-completion."
   ],
   "proofSteps": [
    "Write A_n = A ⊗_Ā Ā/p^n. Then Ω^j_{X/Ā} = lim_n Ω^j_{A_n/(Ā/p^n)} with surjective transition maps, so RΓ(X, Ω^j_{X/Ā}) = R lim_n RΓ(A_n, Ω^j_{A_n/(Ā/p^n)}) (EnhancedDerivedSheaves E4, the sheaf form of derived completion).",
    "By base change (Stacks 0FM0), RΓ(A_n, Ω^j_{A_n}) = RΓ(A, Ω^j_{A/Ā}) ⊗^L_Ā Ā/p^n. Since Ā has bounded p^∞-torsion, the pro-systems {Ā/p^n} and the derived quotients {Ā ⊗^L_{ℤ[t]} ℤ[t]/t^n, t ↦ p} are pro-isomorphic, so R lim_n of the right-hand side is the derived p-completion of RΓ(A, Ω^j) (DerivedDeRhamCohomology DD.1).",
    "RΓ(A, Ω^j_{A/Ā}) is perfect with finite locally free cohomology (A4/hodge-cohomology-of-an-abelian-scheme), so locally it is a finite sum of shifted finite projective Ā-modules, which are derived p-complete because Ā is p-adically complete. Hence RΓ(A, Ω^j) → RΓ(X, Ω^j_{X/Ā}) is an isomorphism.",
    "The de Rham complexes carry finite stupid filtrations with graded pieces Ω^j[−j], respected by the comparison map, so the de Rham statement follows by induction on the filtration. The remaining assertions are A4/hodge-to-de-rham-degeneration and A4/de-rham-cohomology-is-an-exterior-algebra over S = Spec Ā."
   ],
   "acceptance": [
    "Ā = O_C for C a complete algebraically closed extension of ℚ_p (Ā = A_inf/ker θ for the perfect prism A_inf): H^1(X, Ω^•_{X/O_C}) is free of rank 2g, and its reduction modulo the maximal ideal is H^1_dR of the special fibre.",
    "Ā = F_p, from the prism (ℤ_p, (p)): X = A, and the lemma is the characteristic-p case of A4/de-rham-cohomology-is-an-exterior-algebra.",
    "A = E an elliptic curve over Ā: H^2(X, Ω^•_{X/Ā}) ≅ Ā."
   ],
   "prerequisites": [
    "AbelianSchemesAndArithmeticModuli:A4/hodge-cohomology-of-an-abelian-scheme",
    "AbelianSchemesAndArithmeticModuli:A4/hodge-to-de-rham-degeneration",
    "AbelianSchemesAndArithmeticModuli:A4/de-rham-cohomology-is-an-exterior-algebra",
    "DerivedDeRhamCohomology:DD.1",
    "EnhancedDerivedSheaves:E4"
   ],
   "sources": [
    {
     "sourceId": "anschutz-lebras-prismatic-dieudonne",
     "locator": "§4.5, p. 53",
     "excerpt": "Let (A, I) be a bounded prism. Write",
     "match": "The setting: X is the p-adic completion of an abelian scheme over Spec(Ā), (A, I) a bounded prism."
    },
    {
     "sourceId": "anschutz-lebras-prismatic-dieudonne",
     "locator": "Proposition 4.5.1 and its proof, p. 53",
     "excerpt": "Proof. This is [6, Proposition 2.5.2. (i)-(ii)].",
     "match": "The statement as Anschütz–Le Bras give it, with Berthelot–Breen–Messing as their only proof."
    }
   ],
   "implementationStatus": "unchecked"
  }
 ],
 "requests (append)": [
  {
   "supplier": "DerivedDeRhamCohomology:DD.2",
   "need": "For a proper smooth morphism f : X → S of schemes: the relative de Rham complex Ω^•_{X/S} with its stupid filtration σ_{≥p}; Rf_*σ_{≥p}Ω^•_{X/S} perfect for every p, with formation commuting with arbitrary base change (Stacks 0FM0 and its proof); the associative, graded-commutative cup product on H^•_dR(X/S) with F^i ∪ F^j ⊆ F^{i+j} (Stacks 0FM3, 0FM8); the Hodge-to-de Rham spectral sequence (Stacks 0FM6); and the relative Künneth isomorphism Ra_*Ω^•_{X/S} ⊗^L Rb_*Ω^•_{Y/S} ≅ Rf_*Ω^•_{X×_SY/S} for X, Y smooth and quasi-compact with affine diagonal (Stacks 0FMC).",
   "neededBy": [
    "AbelianSchemesAndArithmeticModuli:A4/hodge-to-de-rham-degeneration",
    "AbelianSchemesAndArithmeticModuli:A4/de-rham-cohomology-is-an-exterior-algebra"
   ]
  },
  {
   "supplier": "DerivedDeRhamCohomology:DD.1",
   "need": "For a ring Ā that is p-adically complete with bounded p^∞-torsion: a perfect Ā-complex is derived p-complete, and for M ∈ D(Ā) the derived p-completion of M is R lim_n (M ⊗^L_Ā Ā/p^n).",
   "neededBy": [
    "AbelianSchemesAndArithmeticModuli:A4/de-rham-cohomology-of-the-p-adic-completion"
   ]
  },
  {
   "supplier": "EnhancedDerivedSheaves:E4",
   "need": "For the p-adic completion X of a scheme A of finite type over a p-adically complete ring Ā and a quasi-coherent O_A-module F flat over Ā: RΓ(X, lim_n F/p^nF) = R lim_n RΓ(A, F/p^nF).",
   "neededBy": [
    "AbelianSchemesAndArithmeticModuli:A4/de-rham-cohomology-of-the-p-adic-completion"
   ]
  },
  {
   "supplier": "tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change",
   "need": "For f : X → S proper, flat and of finite presentation and E a finite locally free O_X-module: Rf_*E is perfect and commutes with arbitrary base change (Stacks 0B91); the splitting criterion of Stacks 0A1U (if H^i(K) ⊗ κ(𝔭) → H^i(K ⊗^L κ(𝔭)) is surjective, then locally K ≅ τ_{≤i}K ⊕ τ_{≥i+1}K with τ_{≥i+1}K perfect of tor amplitude in [i+1, ∞]); the projection formula Rf_*(E) ⊗^L K ≅ Rf_*(E ⊗^L Lf^*K) (Stacks 08EU); and the Künneth isomorphism for X, Y tor-independent over S (Stacks 0FLQ).",
   "neededBy": [
    "AbelianSchemesAndArithmeticModuli:A4/cohomology-of-the-structure-sheaf",
    "AbelianSchemesAndArithmeticModuli:A4/hodge-cohomology-of-an-abelian-scheme",
    "AbelianSchemesAndArithmeticModuli:A4/hodge-to-de-rham-degeneration"
   ]
  },
  {
   "supplier": "SchemeAndStackFoundations:SF.2",
   "need": "Grothendieck vanishing: H^r(X, F) = 0 for r > dim X, for a sheaf of abelian groups F on a noetherian topological space X of finite dimension, in particular for a coherent sheaf on a scheme of finite type over a field.",
   "neededBy": [
    "AbelianSchemesAndArithmeticModuli:A4/cohomology-of-the-structure-sheaf"
   ]
  }
 ],
 "gaps (append)": [
  {
   "title": "Borel's structure theorem for graded Hopf algebras over a perfect field",
   "neededBy": [
    "AbelianSchemesAndArithmeticModuli:A4/hopf-algebra-exterior-criterion"
   ],
   "detail": "Milne's Lemma 12.2 rests on Borel's theorem (Borel 1953), which it cites without proof. Hatcher §3.C states Borel's theorem only for finite fields and proves only Hopf's characteristic-zero theorem (3C.4). Neither Borel's 1953 paper nor Kane's book was read, and no layer of the atlas plans the theorem. It is general Hopf-algebra theory, not abelian-scheme theory; its owner is a question for the maintainer (RT-AREA-arithmeticgeometry-1.fixes.md)."
  }
 ],
 "restructure (append)": [
  {
   "action": "rescope",
   "roadmaps": [
    "AbelianSchemesAndArithmeticModuli"
   ],
   "detail": "RT-AREA-arithmeticgeometry-1/1, confirmed: nothing in the atlas plans the all-degree Hodge and de Rham cohomology of an abelian scheme. A4's description says 'These are degree-one statements; invoking the full Hodge or étale comparison theorem as an unnamed dependency is unnecessary', and RS-02's keeps for A4 list only degree-one realizations. The accepted route 7 of PAPER-ANSCHUTZ-LEBRAS-23 nevertheless sends item /97, the whole package, to A4. The nodes A4/hopf-algebra-exterior-criterion to A4/de-rham-cohomology-of-the-p-adic-completion plan it under A4 as an explicit extension of the degree-one scope, resting on A4's degree-one outputs.",
   "proposal": "Add to RS-02's keeps for AbelianSchemesAndArithmeticModuli:A4, and to A4's description: 'For an abelian scheme f : A → S of relative dimension g, prove that R^if_*O_A, R^if_*Ω^j_{A/S} and H^n_dR(A/S) are finite locally free of ranks C(g, i), C(g, i)C(g, j) and C(2g, n) and commute with arbitrary base change, that the Hodge-to-de Rham spectral sequence degenerates at E_1, and that the cup product gives isomorphisms ∧^•R^1f_*O_A ≅ R^•f_*O_A and ∧^•H^1_dR(A/S) ≅ H^•_dR(A/S) of graded algebras, the second filtered (Berthelot–Breen–Messing, Proposition 2.5.2); state the p-adic completion form that prismatic Dieudonné theory uses.' Narrow the sentence 'These are degree-one statements; invoking the full Hodge or étale comparison theorem as an unnamed dependency is unnecessary.' to 'The Hodge and étale comparison theorems are not invoked as unnamed dependencies.' Retitle the layer 'Realizations and deformation theory'. Add DerivedDeRhamCohomology:DD.2 to A4's requirements, as the supplier of the relative de Rham formalism."
  }
 ],
 "coverage (replace the A1, A2 and A4 records)": [
  {
   "stageId": "AbelianSchemesAndArithmeticModuli:A1",
   "status": "not_read",
   "remaining": [
    "Not planned in checkpoint 1: abelian schemes over a base, rigidity over nonreduced bases, the theorem of the cube, and the comparison with the field carrier (Tau Ceti AbelianVariety) and with ModularCurves 1D. Milne's notes treat only the field case; a public source for the relative statements is still to be chosen.",
    "Translation-invariant differentials, Ω^1_{A/S} ≅ f^*e^*Ω^1_{A/S} (RS-02 keeps them in A1): imported by A4/cohomology-of-the-structure-sheaf and A4/hodge-cohomology-of-an-abelian-scheme."
   ]
  },
  {
   "stageId": "AbelianSchemesAndArithmeticModuli:A2",
   "status": "partial",
   "remaining": [
    "Only the Rosati involution is planned (field level). Still to be planned: the relative Picard functor through A0, Raynaud's abelian-space-to-scheme theorem, the dual abelian scheme and Poincaré bundle, φ_L and its identities, polarizations, polarization types, and Riemann–Roch for abelian varieties (deg φ_L = χ(L)²), which the node degree-formulas-for-polarized-isogenies imports.",
    "The identification R^1f_*O_A ≅ Lie(A^∨), finite locally free of rank g and commuting with base change, and at field level T_0Pic_{A/k} ≅ H^1(A, O_A) with dim A^∨ = g: imported by A4/cohomology-of-the-structure-sheaf."
   ]
  },
  {
   "stageId": "AbelianSchemesAndArithmeticModuli:A4",
   "status": "partial",
   "remaining": [
    "The degree-one statements RS-02 keeps: relative H¹_dR with its Hodge exact sequence, locally free of rank 2g and commuting with base change (the all-degree nodes import this as the stage prerequisite A4), the Gauss–Manin connection and the cup-product pairing; the étale Tate-module local system for ℓ invertible on S (at field level T_ℓA free of rank 2g, used by the A6 nodes); the integral complex-homology and de Rham comparisons; and the Serre–Tate equivalence with its tangent-map identification.",
    "The all-degree nodes (A4/hopf-algebra-exterior-criterion to A4/de-rham-cohomology-of-the-p-adic-completion) go beyond RS-02's keeps for A4, as RT-AREA-arithmeticgeometry-1/1 directs; the restructure entry proposes adding them to A4's scope, and until it is applied they realise no stated target.",
    "The gap on Borel's structure theorem, which A4/hopf-algebra-exterior-criterion rests on."
   ]
  }
 ]
}
```
